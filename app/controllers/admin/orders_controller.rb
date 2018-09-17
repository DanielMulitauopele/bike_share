class Admin::OrdersController < Admin::BaseController

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    flash[:notice] = "Order #{order.id} updated successfully!"
    redirect_to order_path(order)
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end
end