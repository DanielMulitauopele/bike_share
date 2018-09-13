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
    if current_user
      order = current_user.orders.create!(total: @cart.contents.values.sum, status: "Ordered" , user_id: current_user.id)

      @cart.contents.each do |id, quantity|
        quantity.times do
          order.accessories << Accessory.find(id)
        end
      end

      flash[:order] = "You have successfully submitted your order totaling $#{@cart.cart_total}!"
      session[:cart] = nil
      redirect_to dashboard_path
    else
      redirect_to login_path
      flash[:alert] = 'Please login before checking out!'
    end
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
