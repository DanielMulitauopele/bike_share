class CartsController < ApplicationController
  def create
    accessory = Accessory.find(params[:accessory_id])
    session[:cart] ||= Hash.new(0)
    session[:cart][accessory.id.to_s] += 1
    flash[:notice] = "You have added #{accessory.title} to your cart!"
    redirect_to bike_shop_path
  end
end
