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
    @cart.destroy_cart_item(accessory.id)
    session[:cart] = @cart.contents
    flash[:notice] = "Successfully removed #{view_context.link_to accessory.title, accessory_path(accessory)} from your cart."
    redirect_to carts_path
  end

  def index
    @items = @cart.format
    @total = @cart.cart_total
  end
end
