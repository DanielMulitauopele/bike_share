class Admin::AccessoriesController< Admin::BaseController
  def index
    @accessories = Accessory.all
  end

  def new
    @accessory = Accessory.new
  end

  def create
    accessory = Accessory.create(accessory_params)
    redirect_to accessory_path(accessory)
    flash[:notice] = "Successfully Created #{accessory.title}"
  end

  private
  def accessory_params
    params.require(:accessory).permit(:title, :description, :price)
  end

end
