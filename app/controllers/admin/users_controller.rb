class Admin::UsersController< Admin::BaseController
  def dashboard
    if params[:status].nil?
      @orders = Order.all
      @accessories = Accessory.all

      @ordered_count = Order.where(status: 'Ordered').count
      @paid_count = Order.where(status: 'Paid').count
      @cancelled_count = Order.where(status: 'Cancelled').count
      @completed_count = Order.where(status: 'Completed').count
    else
      @orders = Order.where(status: params[:status])
    end
  end
end
