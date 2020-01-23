class ProductsController < ApplicationController

  def index
    @pay = Pay.all
    @pay = Pay.new
    # @image = Image.find(1)
  end

  def show
  end

  def new
    @pay = Pays.new
  end 

  def create
  end
end
