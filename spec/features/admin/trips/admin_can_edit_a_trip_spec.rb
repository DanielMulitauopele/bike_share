require 'rails_helper'

describe 'admin can edit a trip' do
  describe 'admin edits from trips index' do
    before(:each) do
      @admin = create(:user, role: 1)
      @station_1 = Station.create!(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station_2 = Station.create!(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')
      @trip = Trip.create!(duration: 100, start_date: '2013-01-09 00:23:00', start_station_id: 1, end_date: '2013-01-09 00:25:00', end_station_id: 2, bike_id: 239, subscription_type: 'subscriber', zip_code: 94063)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end

    it "edits the trip" do
      visit trips_path

      click_on 'Edit'

      fill_in :trip_duration, with: 1000
      fill_in :trip_start_date, with: "2018-09-01"
      select "Wash Park East", from: :trip_start_station_id
      fill_in :trip_end_date, with: "2018-09-02"
      select "Yale St", from: :trip_end_station_id
      fill_in :trip_bike_id, with: 45
      fill_in :trip_subscription_type, with: "Subscriber"
      fill_in :trip_zip_code, with: 98765
      click_on 'Update Trip'

      expect(current_path).to eq(trip_path(@trip))
      expect(page).to have_content("Successfully updated trip.")
      expect(page).to have_content("Duration 1000")
      expect(page).to have_content("Start Date 2018-09-01")
      expect(page).to have_content("Start Station Wash Park East")
      expect(page).to have_content("End Date 2018-09-02")
      expect(page).to have_content("End Station Yale St")
      expect(page).to have_content("Bike ID 45")
      expect(page).to have_content("Subscription Type Subscriber")
      expect(page).to have_content("Zip Code 98765")
    end

    it "cannot edit trip if not given all neccessary information" do
      visit trips_path

      click_on 'Edit'

      fill_in :trip_duration, with: 1000
      fill_in :trip_start_date, with: "2018-09-01"
      select "Wash Park East", from: :trip_start_station_id
      fill_in :trip_end_date, with: "2018-09-02"
      select "Yale St", from: :trip_end_station_id
      fill_in :trip_bike_id, with: ""
      fill_in :trip_subscription_type, with: "Subscriber"
      fill_in :trip_zip_code, with: 98765
      click_on 'Update Trip'

      click_on 'Update Trip'
      expect(page).to have_content("Something went wrong, please try again.")
    end
  end
end
