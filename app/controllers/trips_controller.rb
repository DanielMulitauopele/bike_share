class TripsController< ApplicationController
  def index
    @page = (params[:page] ||= 1).to_i
    @trips = Trip.page(@page).per(30)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @average_duration = Trip.average_duration
    @longest_ride = Trip.longest_ride
    @shortest_ride = Trip.shortest_ride
  end

end
