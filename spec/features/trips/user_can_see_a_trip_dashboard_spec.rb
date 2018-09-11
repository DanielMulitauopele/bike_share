require 'rails_helper'

describe 'visit the trips-dashboard-path' do
  context 'as a registered user' do
		before(:each) do
    	@station_1 = create(:station)
    	@station_2 = create(:station, name: "orange", slug: 'orange')
    	@station_3 = create(:station, name: "blue", slug: 'blue')
    	@trip_1 = Trip.create(duration: 159, start_date:	'2013-01-09 00:23:00', start_station_id:	1	, end_date: '2013-01-09 00:25:00',
        	                  end_station_id: 2, bike_id: 239, subscription_type:	'subscriber', zip_code:	94063)
    	@trip_2 = Trip.create(duration: 39751, start_date:	'2013-01-09 04:06:00', start_station_id:	1	, end_date: '2013-01-09 15:08:00',
      	                    end_station_id: 2, bike_id: 30, subscription_type:	'customer', zip_code:	94063)
    	@trip_3 = Trip.create(duration: 2619, start_date:	'2013-01-09 10:41:00', start_station_id:	2	, end_date: '2013-01-09 11:24:00',
                            end_station_id: 2, bike_id: 30, subscription_type:	'customer', zip_code:	94063)
    	@trip_4 = Trip.create(duration: 1289, start_date:	'2013-01-09 11:30:00', start_station_id:	3	, end_date: '2013-01-09 11:51:00',
                            end_station_id: 3, bike_id: 76, subscription_type:	'customer', zip_code:	872671)
		end
		it 'should show the average duration of a ride' do

		end
  end
end
