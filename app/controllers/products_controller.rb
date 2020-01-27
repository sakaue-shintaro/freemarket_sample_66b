class ProductsController < ApplicationController
  # メンバーが検証中
  # before_action :set_product, except: [:index, :new, :create]

  def index
    @ladies__products = Product.includes(:images).where(category_id: 1).order("created_at DESC").limit(10)
    @mens__products = Product.includes(:images).where(category_id: 2).order("created_at DESC").limit(10)
  end

  def show
    # product_tableの1つの情報を渡す
    @product = Product.find(params[:id])
    # image_tableのproduct_idのカラムがproduct_tableのidと一致した情報
    @images = Image.where(product_id: params[:id])
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

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if user_signed_in? && current_user.id == @product.seller_id && @product.destroy
      redirect_to root_path
      flash[:notice] = "商品を削除しました"
    else
      redirect_to root_path
      flash[:notice] = "自分の商品しか削除できません"
    end
  end

  private

  def product_params
    params.require(:product).permit(:seler_id, :name, :discription, :category_id, :brand, :state, :delivery_fee, :sending_method, :sending_area, :sending_day, :price, images_attributes:  [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end
  
  # メンバーが検証中
  # def set_product
  #   @product = Product.find(params[:id])
  # end

end
