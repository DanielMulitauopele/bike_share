class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  def create
    order = current_user.orders.create!(total: @cart.contents.values.sum, status: "ordered" , user_id: current_user.id)
    flash[:order] = "Order number #{order.id} has been created!"
    redirect_to dashboard_path
  end
end
