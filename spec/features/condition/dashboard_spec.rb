require 'rails_helper'

describe 'visit the condition dashboard' do
  context 'as a visitor' do
    it 'should show me the numbers' do
      station_1 = Station.create(name:"1 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))
      station_2 = Station.create(name:"2 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))

      trip_1 = Trip.create(duration: 100, start_date: "09/01/2018", start_station:station_1, end_date: "09/01/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_3 = Trip.create(duration: 100, start_date: "09/02/2018", start_station:station_1, end_date: "09/02/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_4 = Trip.create(duration: 100, start_date: "09/02/2018", start_station:station_1, end_date: "09/02/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_5 = Trip.create(duration: 100, start_date: "09/03/2018", start_station:station_1, end_date: "09/03/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_6 = Trip.create(duration: 100, start_date: "09/03/2018", start_station:station_1, end_date: "09/03/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_7 = Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_8 = Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_9 = Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_1 = Trip.create(duration: 100, start_date: "09/05/2018", start_station:station_1, end_date: "09/05/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_12 = Trip.create(duration: 100, start_date: "09/06/2018", start_station:station_1, end_date: "09/06/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      trip_13 = Trip.create(duration: 100, start_date: "09/06/2018", start_station:station_1, end_date: "09/06/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )

      condition_1 = Condition.create(date:"09/01/2018", max_temperature:80.0, mean_temperature:75.0, min_temperature:40.0, mean_humidity:12.5, mean_visibility:10.0, mean_wind_speed:10.0, precipitation:1.1)
      condition_2 = Condition.create(date:"09/02/2018", max_temperature:81.0, mean_temperature:76.0, min_temperature:41.0, mean_humidity:13.0, mean_visibility:12.0, mean_wind_speed:5.0, precipitation:0.0)
      condition_2 = Condition.create(date:"09/03/2018", max_temperature:90.0, mean_temperature:75.0, min_temperature:42.0, mean_humidity:27.0, mean_visibility:10.0, mean_wind_speed:16.0, precipitation:3.4)
      condition_2 = Condition.create(date:"09/04/2018", max_temperature:87.0, mean_temperature:78.0, min_temperature:43.0, mean_humidity:14.0, mean_visibility:19.0, mean_wind_speed:0.0, precipitation:2.3)
      condition_2 = Condition.create(date:"09/05/2018", max_temperature:93.0, mean_temperature:72.0, min_temperature:40.0, mean_humidity:30.0, mean_visibility:1.0, mean_wind_speed:0.0, precipitation:1.1)
      condition_2 = Condition.create(date:"09/06/2018", max_temperature:82.0, mean_temperature:73.0, min_temperature:42.0, mean_humidity:18.0, mean_visibility:19.0, mean_wind_speed:12.0, precipitation:0.7)

      visit conditions_dashboard_path

      require 'pry'; binding.pry


      visit conditions_path

      expect(page).to have_content('Conditions Dashboard')


    end
  end
end
