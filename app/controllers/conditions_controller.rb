class ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
  end
  def show
    @condition = Condition.find(params[:id])
  end

  def dashboard
    @temps = [40..49.999, 50..59.999, 60..69.999, 70..79.999, 80..89.999, 90..99.999, 100..110]
    @precip = [0..0.4999, 0.5..0.999, 1..1.4999, 1.5..1.999, 2..2.4999, 2.5..2.999, 3..3.4999, 3.5..3.999]
    @winds_vis = [0..3.999, 4..7.999, 8..11.999, 12..15.999, 16..19.999, 20..24]
    @data = {}
    @temps.each do |temp|
      max_temp = Trip.max_by_temperature(temp)
      min_temp = Trip.min_by_temperature(temp)
      avg_temp = Trip.avg_by_temperature(temp)
      @data[temp.to_s] = []
      if max_temp
        @data[temp.to_s] << [max_temp.start_date.strftime("%F"), max_temp.count]
      else
        @data[temp.to_s] << ['No Results', 0]
      end
      if min_temp
        @data[temp.to_s] << [min_temp.start_date.strftime("%F"), min_temp.count]
      else
        @data[temp.to_s] << ['No Results', 0]
      end
      if avg_temp
        @data[temp.to_s] << [avg_temp]
      else
        @data[temp.to_s] << ['No Results']
      end
    end
    @precip_data = {}

    @precip.each do |precip|
    @precip_data[precip.to_s] = []
      max_precip = Trip.max_by_precipitation(precip)
      min_precip = Trip.min_by_precipitation(precip)
      avg_precip = Trip.avg_by_precipitation(precip)
      if max_precip
        @precip_data[precip.to_s] << [max_precip.start_date.strftime("%F"), max_precip.count]
      else
        @precip_data[precip.to_s] << ['No Results', 0]
      end
      if min_precip
        @precip_data[precip.to_s] << [min_precip.start_date.strftime("%F"), min_precip.count]
      else
        @precip_data[precip.to_s] << ['No Results', 0]
      end
      if avg_precip
        @precip_data[precip.to_s] << [avg_precip]
      else
        @precip_data[precip.to_s] << ['No Results']
      end
    end
    @wind_data = {}

    @winds_vis.each do |wind|
    @wind_data[wind.to_s] = []
      max_wind = Trip.max_by_wind(wind)
      min_wind = Trip.min_by_wind(wind)
      avg_wind = Trip.avg_by_wind(wind)
      if max_wind
        @wind_data[wind.to_s] << [max_wind.start_date.strftime("%F"), max_wind.count]
      else
        @wind_data[wind.to_s] << ['No Results', 0]
      end
      if min_wind
        @wind_data[wind.to_s] << [min_wind.start_date.strftime("%F"), min_wind.count]
      else
        @wind_data[wind.to_s] << ['No Results', 0]
      end
      if avg_wind
        @wind_data[wind.to_s] << [avg_wind]
      else
        @wind_data[wind.to_s] << ['No Results']
      end
    end
    @vis_data = {}
    @winds_vis.each do |visibility|
    @vis_data[visibility.to_s] = []
      max_visibility = Trip.max_by_visibility(visibility)
      min_visibility = Trip.min_by_visibility(visibility)
      avg_visibility = Trip.avg_by_visibility(visibility)
      if max_visibility
        @vis_data[visibility.to_s] << [max_visibility.start_date.strftime("%F"), max_visibility.count]
      else
        @wind_data[visibility.to_s] << ['No Results', 0]
      end
      if min_visibility
        @wind_data[visibility.to_s] << [min_visibility.start_date.strftime("%F"), min_visibility.count]
      else
        @wind_data[visibility.to_s] << ['No Results', 0]
      end
      if avg_visibility
        @wind_data[visibility.to_s] << [avg_visibility]
      else
        @wind_data[visibility.to_s] << ['No Results']
      end
    end
  end
end
