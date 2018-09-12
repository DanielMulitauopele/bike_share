class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def create
    if current_user
      cureent_user.orders.create
      redirect_to dashboard_path
      flash[:notice] = 'You have successfully submitted your order totaling $total'
    else 
      redirect_to login_path
      flash[:alert] = 'Please login first'
    end  
  end

end
