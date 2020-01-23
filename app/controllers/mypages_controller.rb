class MypagesController < ApplicationController

  def index
    @pay = Pay.all
    @pay = Pay.new
  end

  def new
    @pay = Pay.new
  end

  def create
    
  end
end
