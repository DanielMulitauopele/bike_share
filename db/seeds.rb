require 'csv'

Condition.destroy_all
Station.destroy_all
Trip.destroy_all

CSV.foreach('./db/csv/station.csv', headers: true, header_converters: :symbol) do |station|
  station = Station.new(
    id: station[:id],
    name: station[:name],
    dock_count: station[:dock_count],
    city: station[:city],
    installation_date: station[:installation_date],
  )
  if !station.save
    next
  else
    station.save
  end
end

CSV.foreach('./db/csv/weather.csv', headers: true, header_converters: :symbol) do |condition|
  weather = Condition.new(
    date: condition[:date],
    max_temperature: condition[:max_temperature_f],
    mean_temperature: condition[:mean_temperature_f],
    min_temperature: condition[:min_temperature_f],
    mean_humidity: condition[:mean_humidity],
    mean_visibility: condition[:mean_visibility_miles],
    mean_wind_speed: condition[:mean_wind_speed_mph],
    precipitation: condition[:precipitation_inches]
  )
  if !weather.save
    next
  else
    weather.save
  end
end

CSV.foreach('./db/csv/trip.csv', headers: true, header_converters: :symbol) do |trip|
  trips = Trip.new(
    duration: trip[:duration],
    start_date: trip[:start_date],
    start_station_id: trip[:start_station_id],
    end_date: trip[:end_date],
    end_station_id: trip[:end_station_id],
    bike_id: trip[:bike_id],
    subscription_type: trip[:subscription_type],
    zip_code: trip[:zip_code]
  )
  if !trips.save
    next
  else
    trips.save
  end
end

ActiveRecord::Base.connection.reset_pk_sequence!('stations')
ActiveRecord::Base.connection.reset_pk_sequence!('trips')
ActiveRecord::Base.connection.reset_pk_sequence!('conditions')
