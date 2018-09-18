require 'rails_helper'

describe 'User sees all trips' do
  before(:each) do
  	@station_1 = create(:station, name: "yellow", slug: 'yellow')
  	@station_2 = create(:station, name: "orange", slug: 'orange')
  	@trip_1 = Trip.create!( duration: 100,
                            start_date:	'2013-01-09 00:23:00',
                            start_station_id:	1	,
                            end_date: '2013-01-09 00:25:00',
        	                  end_station_id: 2,
                            bike_id: 239,
                            subscription_type:	'subscriber',
                            zip_code:	94063
                          )
  	@trip_2 = Trip.create!( duration: 200,
                            start_date:	'2013-02-09 04:06:00',
                            start_station_id:	1	,
                            end_date: '2013-02-09 15:08:00',
      	                    end_station_id: 2,
                            bike_id: 30,
                            subscription_type: 'customer',
                            zip_code:	94063
                          )
  end

  it 'they can not edit or delete a trip as a regular user' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit trips_path

    expect(page).to_not have_content('Edit')
    expect(page).to_not have_content('Delete')
  end

  describe 'As an Admin' do
    it 'they can edit or delete a trip' do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit trips_path
      expect(page).to have_content('Edit')
      expect(page).to have_content('Delete')
    end
  end
end

