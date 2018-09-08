class TripsController< ApplicationController
  def index
    @page = (params[:page] ||= 1).to_i
    @trips = Trip.page(@page).per(30)
  end

end
