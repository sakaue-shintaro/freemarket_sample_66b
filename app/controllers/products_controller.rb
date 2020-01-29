class ProductsController < ApplicationController
  #必ず最後にもどす！！！！
  before_action :set_product, except: [:index, :new, :create]

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
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end 
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  

  def buy
  end

  def purchase
    Payjp.api_key = "sk_test_88ede2748be3db6794ece94e"
    @images = Image.where(product_id: @product.id)
    @address= Address.find_by(user_id: current_user.id)
    card = Card.where(user_id: current_user.id).first
    @cards = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  def destroy
    if user_signed_in? && current_user.id == @product.seller_id && @product.destroy
      redirect_to root_path
      flash[:notice] = "商品を削除しました"
    else
      redirect_to root_path
      flash[:notice] = "自分の商品しか削除できません"
    end
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

end