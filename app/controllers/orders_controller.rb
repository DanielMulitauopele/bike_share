class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @accessories = @cart.format
  end

  def create
    order = current_user.orders.create!(total: @cart.contents.values.sum, status: "Ordered" , user_id: current_user.id)
    flash[:order] = "Order number #{order.id} has been created!"
    redirect_to dashboard_path
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
