class OrdersController < ApplicationController

  def show
    if current_user?
      @order = Order.find(params[:id])
      @accessories = @order.format
    else
      render file: "/public/404"
    end
  end

  def create
    if current_user && @cart.total_count != 0
      order = current_user.orders.create!(total: @cart.contents.values.sum, status: "Ordered", user_id: current_user.id)
      @cart.contents.each do |id, quantity|
        quantity.times do
          order.accessories << Accessory.find(id)
        end
      end
      flash[:order] = "You have successfully submitted your order totaling $#{@cart.cart_total}!"
      session[:cart] = nil
      redirect_to dashboard_path
    elsif current_user && @cart.total_count == 0
      flash[:notice] = "Your cart is empty, please add items from the #{view_context.link_to 'bike shop', bike_shop_path} to your cart before checking out!"
      redirect_to carts_path
    else
      redirect_to login_path
      flash[:alert] = 'Please login before checking out!'
    end
  end
end
