class StationsController < ApplicationController
  
  def dashboard
    @stations_count = Station.stations_total_count
    @average_docks = Station.average_docks
    @max_bikes = Station.most_bikes
    @station_max_bikes = Station.most_bikes_station
    @min_bikes = Station.fewest_bikes
    @station_min_bikes = Station.fewest_bikes_station
    @newest_station = Station.newest_installation
    @oldest_station = Station.oldest_installation
  end
  
  def index
    @stations = Station.all
  end

  def show
    @station = Station.friendly.find(params[:id])
  end
end
