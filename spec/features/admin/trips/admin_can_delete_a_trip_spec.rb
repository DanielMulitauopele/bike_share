require 'rails_helper'

describe 'admin can delete a trip' do
  describe 'admin links from trips index' do
    before(:each) do
      @admin = create(:user, role: 1)
      @station_1 = Station.create!(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station_2 = Station.create!(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')
      @trip = Trip.create!(duration: 100, start_date: '2013-01-09 00:23:00', start_station_id: 1, end_date: '2013-01-09 00:25:00', end_station_id: 2, bike_id: 239, subscription_type: 'subscriber', zip_code: 94063)
    end

    it 'deletes a trip' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit trips_path

      click_on 'Delete'

      expect(page).to_not have_content(@trip.id)
      expect(page).to have_content("Trip successfully deleted.")
      expect(page).to_not have_content("Duration: #{@trip.duration}")
    end
  end
end
