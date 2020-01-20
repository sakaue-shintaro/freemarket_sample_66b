class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    # @image = Image.find(1)
    @products = Product.includes(:images).order('created_at DESC')
  end

  def show
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

  private

  def product_params
    params.require(:product).permit(:seler_id, :name, :discription, :category_id, :brand, :state, :delivery_fee, :sending_area, :sending_day, :price, images_attributes:  [:src, :_destroy, :id]).merge(seller_id: User.find(1).id)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end
