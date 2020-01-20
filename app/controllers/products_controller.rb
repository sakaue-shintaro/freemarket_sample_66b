class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images)
  end

  def show
  end

  def new
  end
  
end