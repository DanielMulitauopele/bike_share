require 'rails_helper'

describe 'admin creates new trip' do
  describe 'they link from the trip index page' do
    describe 'they fill in the new form' do
      before(:each) do
        admin = create(:user, role: 1)
        @station_1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
        @station_2 = Station.create(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit trips_path
        click_link "Create New Trip"
      end

      it "creates a new trip" do
        expect(current_path).to eq(new_admin_trip_path)

        fill_in :trip_duration, with: 1000
        fill_in :trip_start_date, with: "2018-09-01"
        select "Wash Park East", from: :trip_start_station_id
        fill_in :trip_end_date, with: "2018-09-02"
        select "Yale St", from: :trip_end_station_id
        fill_in :trip_bike_id, with: 45
        fill_in :trip_subscription_type, with: "Subscriber"
        fill_in :trip_zip_code, with: 98765

        click_on "Create Trip"

        expect(page).to have_content("Trip successfully created!")
        expect(page).to have_content("Duration: 1000")
        expect(page).to have_content("Start Date: 2018-09-01")
        expect(page).to have_content("Start Station: Wash Park East")
        expect(page).to have_content("End Date: 2018-09-02")
        expect(page).to have_content("End Station: Yale St")
        expect(page).to have_content("Bike ID: 45")
        expect(page).to have_content("Subscription Type: Subscriber")
        expect(page).to have_content("Zip Code: 98765")
      end

      it "it should fail if not all information provided" do
        expect(current_path).to eq(new_admin_trip_path)

        fill_in :trip_start_date, with: "2018-09-01"
        select "Wash Park East", from: :trip_start_station_id
        fill_in :trip_end_date, with: "2018-09-02"
        select "Yale St", from: :trip_end_station_id
        fill_in :trip_bike_id, with: 45
        fill_in :trip_zip_code, with: 98765

        click_on "Create Trip"
        expect(page).to have_content("Oops, something went wrong, please try again!")
      end
    end
  end
end
