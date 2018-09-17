class TripsController< ApplicationController
  def index
    @page = (params[:page] ||= 1).to_i
    @trips = Trip.page(@page).per(30)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def dashboard
    @average_duration = (Trip.average_duration / 60)
    @longest_ride = Trip.longest_ride
    @shortest_ride = Trip.shortest_ride
    @most_popular_start_station = Station.max_starting_station
    @most_popular_end_station = Station.max_ending_station
    @grouped_by_month_year = Trip.group_by_month_year
    @grouped_by_year = Trip.group_by_year
    @most_ridden_bike = Trip.most_ridden_bike
    @least_ridden_bike = Trip.least_ridden_bike
    @distribution_by_subscriber = Trip.distribution_by_subscription
    @max_day = Trip.max_day
    @min_day = Trip.min_day
    @max_day_weather = Condition.max_day_weather(@max_day)
    @min_day_weather = Condition.min_day_weather(@min_day)
  end
end
