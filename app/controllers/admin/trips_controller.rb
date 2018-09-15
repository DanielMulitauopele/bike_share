class Admin::TripsController < Admin::BaseController

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    if @trip.save
      flash[:notice] = "Trip successfully created!"
      redirect_to trip_path(@trip)
    else
      flash[:alert] = 'Oops, something went wrong, please try again!'
      render :new
    end
  end

  def destroy
    Trip.destroy(params[:id])
    flash[:notice] = "Trip successfully deleted."
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:duration, :start_date, :start_station_id, :end_date, :end_station_id, :bike_id, :subscription_type, :zip_code)
    end
end
