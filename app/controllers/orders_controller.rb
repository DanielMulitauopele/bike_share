class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @accessories = @cart.format
  end
  
  def create
    if current_user
      order = current_user.orders.create!(total: @cart.contents.values.sum, status: "ordered" , user_id: current_user.id)
      flash[:order] = "You have successfully submitted your order totaling $total!"
      redirect_to dashboard_path
    else 
      redirect_to login_path
      flash[:order] = "Please login first befor checkout"
    end
  end
end
