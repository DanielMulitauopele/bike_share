require 'rails_helper'

describe 'admin creates new trip' do
  describe 'they link from the trip index page' do
    describe 'they fill in the new form' do
      it "creates a new trip" do
        station_1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
        station_2 = Station.create(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')

        visit trips_path
        click_link "Create New Trip"

        expect(current_path).to eq(new_admin_trip_path)

        fill_in "trip[:duration]", with: 1000
        fill_in "trip[:start_date]", with: "2018-09-01"
        fill_in "trip[:start_station_id]", with: 1
        fill_in "trip[:end_date]", with: "2018-09-02"
        fill_in "trip[:end_station_id]", with: 2
        fill_in "trip[:bike_id]", with: 45
        fill_in "trip[:subscription_type]", with: "Subscriber"

        click_on "Create Trip"

        expect(current_path).to eq(trips_path(trip))
        expect(page).to have_content("Duration: 1000")
        expect(page).to have_content("Start Date: 2018-09-01")
        expect(page).to have_content("Start Station: Wash Park East")
        expect(page).to have_content("End Date: 2018-09-02")
        expect(page).to have_content("End Station: Yale St")
        expect(page).to have_content("Bike ID: 45")
        expect(page).to have_content("Subscription Type: Subscriber")
      end
    end
  end
end
