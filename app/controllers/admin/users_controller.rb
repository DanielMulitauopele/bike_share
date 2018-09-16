class Admin::UsersController< Admin::BaseController
  def dashboard
    @orders = Order.all
    # @orders_by_status_count = Order.orders_by_status_count
    @ordered_count = Order.where(status: 'Ordered').count
    @paid_count = Order.where(status: 'Paid').count
    @cancelled_count = Order.where(status: 'Cancelled').count
    @completed_count = Order.where(status: 'Completed').count
  end
end
