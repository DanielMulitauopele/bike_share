class TripsController< ApplicationController
  def index
    page = params[:page] ||= 0
    @trips = Trip.page(page).per(30)
  end

end
