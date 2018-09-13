require 'rails_helper'

describe 'visit the condition dashboard' do
  context 'as a visitor' do
    it 'should show me the numbers' do
      station_1 = Station.create(name:"1 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))
      station_2 = Station.create(name:"2 station",dock_count: 3, city: "Denver", installation_date: Date.strptime("03/23/2016", '%m/%d/%Y'))

      Trip.create(duration: 100, start_date: "09/01/2018", start_station:station_1, end_date: "09/01/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      Trip.create(duration: 100, start_date: "09/02/2018", start_station:station_1, end_date: "09/02/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      Trip.create(duration: 100, start_date: "09/02/2018", start_station:station_1, end_date: "09/02/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      Trip.create(duration: 100, start_date: "09/04/2018", start_station:station_1, end_date: "09/04/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      Trip.create(duration: 100, start_date: "09/06/2018", start_station:station_1, end_date: "09/06/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )
      Trip.create(duration: 100, start_date: "09/06/2018", start_station:station_1, end_date: "09/06/2018", end_station:station_2,bike_id: 2, subscription_type:"Subsciber", zip_code: 94127 )

      Condition.create(date:"09/01/2018", max_temperature:80.0, mean_temperature:75.0, min_temperature:40.0, mean_humidity:12.5, mean_visibility:10.0, mean_wind_speed:10.0, precipitation:1.1)
      Condition.create(date:"09/02/2018", max_temperature:81.0, mean_temperature:76.0, min_temperature:41.0, mean_humidity:13.0, mean_visibility:12.0, mean_wind_speed:5.0, precipitation:0.0)
      Condition.create(date:"09/04/2018", max_temperature:87.0, mean_temperature:78.0, min_temperature:43.0, mean_humidity:14.0, mean_visibility:19.0, mean_wind_speed:0.0, precipitation:2.3)
      Condition.create(date:"09/06/2018", max_temperature:82.0, mean_temperature:73.0, min_temperature:42.0, mean_humidity:18.0, mean_visibility:19.0, mean_wind_speed:12.0, precipitation:0.7)

      visit conditions_dashboard_path

      expect(page).to have_content('Conditions Dashboard')

      save_and_open_page
      expect(page).to have_content("Max # of Rides: 2018-04-09 : 3")
      expect(page).to have_content("Min # of Rides: 2018-01-09 : 1")
      expect(page).to have_content("Avg # of Rides: 2")

      expect(page).to have_content("Max # of Rides: 2018-02-09 : 2")
      expect(page).to have_content("Min # of Rides: 2018-02-09 : 2")
      expect(page).to have_content("Avg # of Rides: 2")

      expect(page).to have_content("Max # of Rides: 2018-04-09 : 3")
      expect(page).to have_content("Min # of Rides: 2018-04-09 : 3")
      expect(page).to have_content("Avg # of Rides: 3")

      expect(page).to have_content("Max # of Rides: 2018-06-09 : 2")
      expect(page).to have_content("Min # of Rides: 2018-06-09 : 2")
      expect(page).to have_content("Avg # of Rides: 2")
    end
  end
end
