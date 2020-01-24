class ProductsController < ApplicationController

  def index
    @ladies__products = Product.includes(:images).where(category_id: 1).order("created_at DESC").limit(10)
    @mens__products = Product.includes(:images).where(category_id: 2).order("created_at DESC").limit(10)
  end

  def show
  end

  def new
  end
  
end