class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:accessory_id])
    @cart.add_accessory(accessory.id.to_s)
    session[:cart] = @cart.contents
    quantity = @cart.count_of(accessory.id.to_s)
    flash[:notice] = "You now have #{quantity} of #{accessory.title} in your cart."
    redirect_to bike_shop_path
  end

  def destroy
    accessory = Accessory.find(params[:accessory_id])
    @cart.subtract_accessory(accessory.id.to_s)
    session[:cart] = @cart.contents

    flash[:notice] = "Successfully removed #{view_context.link_to accessory.title, accessory_path(accessory)} from your cart."
    redirect_to carts_path
  end

  def index
    @new_hash = Hash.new(0)
    @cart.contents.each do |key, value|
      @new_hash[Accessory.find(key.to_i)] = value
    end
    @total = 0
    @new_hash.each do |key, value|
      @total += (key.price * value).to_i
    end
  end
end
