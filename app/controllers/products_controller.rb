class ProductsController < ApplicationController

  def index
    @ladies__products = Product.includes(:images).where(category_id: 1)
    @mens__products = Product.includes(:images).where(category_id: 2)
  end

  def show
  end

  def new
  end
  
end