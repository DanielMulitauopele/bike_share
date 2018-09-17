class Admin::UsersController< Admin::BaseController
  def dashboard
    if params[:status].nil?
      @orders = Order.all
    else
      @orders = Order.where(status: params[:status])
    end

    @accessories = Accessory.all
    @ordered_count = Order.where(status: 'Ordered').count
    @paid_count = Order.where(status: 'Paid').count
    @canceled_count = Order.where(status: 'Canceled').count
    @completed_count = Order.where(status: 'Completed').count
  end
end
