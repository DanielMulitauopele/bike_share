require 'rails_helper'

describe 'visit the trips-dashboard-path' do
  context 'as a registered user' do
		before(:each) do
    	@station_1 = create(:station, name: "yellow", slug: 'yellow')
    	@station_2 = create(:station, name: "orange", slug: 'orange')
    	@station_3 = create(:station, name: "blue", slug: 'blue')
    	@trip_1 = Trip.create!(duration: 100, start_date:	'2013-01-09 00:23:00', start_station_id:	1	, end_date: '2013-01-09 00:25:00',
        	                  end_station_id: 2, bike_id: 239, subscription_type:	'subscriber', zip_code:	94063)
    	@trip_2 = Trip.create!(duration: 200, start_date:	'2013-02-09 04:06:00', start_station_id:	1	, end_date: '2013-02-09 15:08:00',
      	                    end_station_id: 2, bike_id: 30, subscription_type:	'customer', zip_code:	94063)
    	@trip_3 = Trip.create!(duration: 100, start_date:	'2013-02-09 10:41:00', start_station_id:	2	, end_date: '2013-02-09 11:24:00',
                            end_station_id: 2, bike_id: 30, subscription_type:	'customer', zip_code:	94063)
    	@trip_4 = Trip.create!(duration: 200, start_date:	'2013-02-09 11:30:00', start_station_id:	3	, end_date: '2013-02-09 11:51:00',
                            end_station_id: 3, bike_id: 76, subscription_type:	'customer', zip_code:	872671)
		end
		it 'should show the average duration of a ride' do
      visit trips_dashboard_path

      expect(page).to have_content("Average Trip Duration: 150")
		end
		it 'should show the longest ride' do
    	trip = Trip.create(duration: 500, start_date:	'2013-01-09 11:30:00', start_station_id:	3	, end_date: '2013-01-09 11:51:00',
                            end_station_id: 3, bike_id: 76, subscription_type:	'customer', zip_code:	872671)
      visit trips_dashboard_path

      expect(page).to have_content("Longest Ride: #{trip.id}")
		end
		it 'should show the shortest ride' do
    	trip = Trip.create(duration: 50, start_date:	'2013-01-09 11:30:00', start_station_id:	3	, end_date: '2013-01-09 11:51:00',
                            end_station_id: 3, bike_id: 76, subscription_type:	'customer', zip_code:	872671)
      visit trips_dashboard_path

      expect(page).to have_content("Shortest Ride: #{trip.id}")
		end
		it 'should show the start station with the most rides' do
      visit trips_dashboard_path

      expect(page).to have_content("Most Popular Start Location #{@station_1.name}")
		end
    it 'should show the end station with the most rides' do
      visit trips_dashboard_path

      expect(page).to have_content("Most Popular End Location #{@station_2.name}")
		end
    it 'should show the count of rides grouped by month/year' do
      visit trips_dashboard_path

      expect(page).to have_content("Jan-2013: 1")
      expect(page).to have_content("Feb-2013: 3")
    end
    it 'should show the count of rides grouped by year' do
    	Trip.create(duration: 50, start_date:	'2014-01-09 11:30:00', start_station_id:	3	, end_date: '2014-01-09 11:51:00',
                            end_station_id: 3, bike_id: 76, subscription_type:	'customer', zip_code:	872671)
      visit trips_dashboard_path

      expect(page).to have_content("2013: 4")
      expect(page).to have_content("2014: 1")
    end
    it 'should show the distribution of rides grouped by subscription type' do
      visit trips_dashboard_path

      expect(page).to have_content("Subscriber: 25.0%")
      expect(page).to have_content("Customer: 75.0%")
    end
    it 'it should show the date with the most rides' do
      visit trips_dashboard_path

      expect(page).to have_content("Most Popular Day: 2013-02-09: 3")
    end
    it 'it should show the date with the least rides' do
      visit trips_dashboard_path

      expect(page).to have_content("Least Popular Day: 2013-01-09: 1")
    end
  end
end
