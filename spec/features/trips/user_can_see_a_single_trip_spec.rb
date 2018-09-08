require 'rails_helper'

describe 'Visit trip show page' do
  context 'As a visitor' do
    it 'should should a single trip' do
      trip = create(:trip)

      visit trip_path(trip)

      expect(page).to have_content("Duration:   #{trip.duration}")
      expect(page).to have_content("Start Date: #{trip.start_date}")
      expect(page).to have_content("Start Station: #{trip.start_station}")
      expect(page).to have_content("End Date: #{trip.end_date}")
      expect(page).to have_content("End Station: #{trip.end_station}")
      expect(page).to have_content("Bike ID: #{trip.bike_id}")
      expect(page).to have_content("Subscription Type: #{trip.subscription_type}")
      expect(page).to have_content("Zip Code: #{trip.zip_code}")
    end
  end
end
