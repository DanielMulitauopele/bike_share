class Admin::StationsController < Admin::BaseController
  
  def new 
    @admin = current_user
    @station = Station.new 
  end 
  
  def create 
    @station = Station.create(station_params)
    if @station.save 
      flash[:notice] = "Station #{@station.name} successfully created!"
      redirect_to station_path(@station)
    else 
      flash[:alert] = 'Oops, something went wrong, please try again!'
      render :new
    end
  end 
  
  private 
    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end
end