class Admin::StationsController < Admin::BaseController

  def new
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

  def edit
    @station = Station.find_by(slug: params[:id])
  end

  def update
    @station = Station.find_by(slug: params[:id])
    @station.update(station_params)
    if @station.save
      @station.should_generate_new_friendly_id?
      flash[:notice] = "Successfully updated station #{@station.name}."
      redirect_to station_path(@station)
    else
      flash[:alert] = 'Oops, something went wrong, please try again!'
      render :edit
    end
  end

  def destroy
    station = Station.find_by(slug: params[:id])
    station.destroy
    flash[:notice] = "Station successfully deleted."
    redirect_to stations_path
  end

  private
    def station_params
      params.require(:station).permit(:name, :dock_count, :city, :installation_date)
    end
end
