class ProductsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_product, except: [:index, :new, :create]
  before_action :seller_id_is_current_user_id, only: [:edit, :update, :destroy]

  require 'payjp'

  def index
      @ladies = Product.includes(:images).where(category_id: 1).order("created_at DESC").limit(10)
      @mens = Product.includes(:images).where(category_id: 2).order("created_at DESC").limit(10)
  end

  def show
    # product_tableの1つの情報を渡す
    # image_tableのproduct_idのカラムがproduct_tableのidと一致した情報
    @images = Image.where(product_id: @product.id)
    # user_tableの主キーとproduct_tableのseller_idが一致した情報を渡す
    @user = User.find_by(id: @product.seller_id)
  end

  def new
      @product = Product.new
      @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.images == [] || @product.images.ids == [nil]
      redirect_to :back
      flash[:notice] = "必ず画像を1枚以上選択して下さい。"
    else
      if @product.save!
        redirect_to root_path
      else
        redirect_to :back
      end
    end
  end

  def edit
  end 

  def update
      if @product.images == [] || @product.images.ids == [nil]
        redirect_to :back
        flash[:notice] = "必ず画像を1枚以上選択して下さい。"
      else
        @product.update(product_params)
        redirect_to root_path
      end
  end

  def purchase
    if @product.buyer_id == nil
      if current_user.id != @product.seller_id
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        @images = Image.where(product_id: @product.id)
        @address= Address.find_by(user_id: current_user.id)
        card = Card.where(user_id: current_user.id).first
        @cards = Card.find_by(user_id: current_user.id)
        if card
          customer = Payjp::Customer.retrieve(card.customer_id)
          @default_card_information = customer.cards.retrieve(card.card_id)
        else
          redirect_to credit_mypages_path
          flash[:notice] = "クレジットカード登録をして下さい"
        end
      else
        redirect_to root_path
        flash[:notice] = "自分の商品は購入できません"
      end
    else
      redirect_to root_path
      flash[:notice] = "この商品は、既に売却済です"
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
    flash[:notice] = "商品を削除しました"
  end

  def done
    @product.buyer_id = current_user.id
    if @product.save!
      # 別コントローラー(purchases_controllerのdef pay)で、products内のdone.haml.htmlを読むように指示している。
      # そのため、ここでは何も指示をしなくても、問題ないと思われる(正常動作する)
      # 処理の流れ：別コントローラーでpayjpの処理を行う→このdefで、buyer_id = current_user.id後、@product.save!を行う → done.haml.htmlが表示される
    else
      render :purchase
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:seller_id, :name, :discription, :category_id, :brand, :state, :delivery_fee, :sending_method, :sending_area, :sending_day, :price, images_attributes:  [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

  def require_login
    unless user_signed_in?
      redirect_to user_session_path
      flash[:notice] = "ログインをして下さい"
    end
  end

  def seller_id_is_current_user_id
    if current_user.id == @product.seller_id
      # 編集画面に遷移する
    else
      redirect_to root_path
      flash[:notice] = "自分の商品しか、編集・削除は行えません"
    end
  end

end
