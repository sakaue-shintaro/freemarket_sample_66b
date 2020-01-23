class MypagesController < ApplicationController

  def new
    @pay = Pay.new
  end

end
