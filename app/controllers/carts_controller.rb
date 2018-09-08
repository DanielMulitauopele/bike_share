class CartsController < ApplicationController
  def create
    require "pry"; binding.pry
    accessory = Accessory.find(params[:accessory_id])
    session[:cart] ||= Hash.new(0)
    # require "pry"; binding.pry
    session[:cart][accessory.id] += 1
    flash[:notice] = "You have added an #{accessory.title} to your cart!"
    redirect_to bike_shop_path
  end
end
