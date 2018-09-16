require 'rails_helper'

describe 'as an admin' do
  describe 'visiting trip show page' do
    it "should should edit/delete buttons" do
      station = create(:station)
      trip = create(:trip, start_station_id: station.id, end_station_id: station.id)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_trip_path(trip)

      expect(page).to have_content("Duration:   #{trip.duration}")
      expect(page).to have_content("Start Date: #{trip.start_date}")
      expect(page).to have_content("Start Station: #{trip.start_station.name}")
      expect(page).to have_content("End Date: #{trip.end_date}")
      expect(page).to have_content("End Station: #{trip.end_station.name}")
      expect(page).to have_content("Bike ID: #{trip.bike_id}")
      expect(page).to have_content("Subscription Type: #{trip.subscription_type}")
      expect(page).to have_link("Edit")
      expect(page).to have_link("Delete")
    end
  end
end
