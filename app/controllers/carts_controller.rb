class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:accessory_id])

    @cart.add_accessory(accessory.id.to_s)
    session[:cart] = @cart.contents
    quantity = @cart.count_of(accessory.id.to_s)
    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{accessory.title} in your cart."
    redirect_to bike_shop_path
  end

  def index
    @new_hash = Hash.new(0)
    @cart.contents.each do |key, value|
      @new_hash[Accessory.find(key.to_i)] = value
    end
  end
end
