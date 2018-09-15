require 'rails_helper'

describe 'admin can delete a trip' do
  describe 'admin links from trips index' do
    before(:each) do
      @admin = create(:user, role: 1)
      @user = create(:user, email: 'fake@fake.com')
      @station_1 = Station.create!(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station_2 = Station.create!(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')
      @trip_1 = Trip.create!(duration: 100, start_date: '2013-01-09 00:23:00', start_station_id: 1, end_date: '2013-01-09 00:25:00', end_station_id: 2, bike_id: 239, subscription_type: 'subscriber', zip_code: 94063)
    	@trip_2 = Trip.create!(duration: 200, start_date: '2013-02-09 04:06:00', start_station_id: 1, end_date: '2013-02-09 15:08:00', end_station_id: 2, bike_id: 30, subscription_type: 'customer', zip_code: 94063)
    end

    it 'deletes a trip' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit trips_path

      within("#trip-#{@trip_1.id}") do
        click_on 'Delete'
      end

      expect(page).to have_content(@trip_2.id)
      expect(page).to have_content("Duration: #{@trip_2.duration}")
      expect(page).to_not have_content(@trip_1.id)
      expect(page).to_not have_content("Duration: #{@trip_1.duration}")
    end

    it "does not allow a user to delete a trip" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit trips_path

      expect(page).to_not have_content('Delete')
    end
  end
end
