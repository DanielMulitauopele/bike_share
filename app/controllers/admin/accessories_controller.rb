class Admin::AccessoriesController< Admin::BaseController
  def index
    @accessories = Accessory.all
  end

  def new
    @accessory = Accessory.new
  end

  def create
    accessory = Accessory.create(accessory_params)
    if accessory.save
      flash[:notice] = "Successfully Created #{accessory.title}"
      redirect_to accessory_path(accessory)
    else
      flash[:alert] = 'Oops, something went wrong, please try again!'
      render :new 
    end
  end

  def edit
    @accessory = Accessory.find(params[:id])
  end

  def update
    @accessory = Accessory.find(params[:id])
    @accessory.update(accessory_params)
    if @accessory.save
      flash[:notice] = "Successfully updated accessory."
      redirect_to admin_bike_shop_path
    else
      flash[:alert] = "Something went wrong, please try again."
      render :edit
    end
  end

  private
  def accessory_params
    params.require(:accessory).permit(:title, :description, :price, :status)
  end

end
