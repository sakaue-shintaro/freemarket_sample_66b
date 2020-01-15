class ProductsController < ApplicationController

  def index
    @image = Image.find(1)
  end

  def show
  end
end
