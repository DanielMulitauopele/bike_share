require 'rails_helper'

describe 'Visit Trips Index' do
  context 'As a visitor' do
    it 'should show the first 30 trips' do
      trips_array = []
      second_trips_array = []
      30.times {trips_array << create(:trip)}
      32.times {second_trips_array << create(:trip, duration: 2500)}

      visit trips_path

      expect(page).to have_content('All Trips')
      expect(page).to have_content("Duration:   #{trips_array[0].duration}")
      expect(page).to have_content("Start Date: #{trips_array[0].start_date}")
      expect(page).to have_content("Start Station: #{trips_array[0].start_station}")
      expect(page).to have_content("End Date: #{trips_array[0].end_date}")
      expect(page).to have_content("End Station: #{trips_array[0].end_station}")
      expect(page).to have_content("Bike ID: #{trips_array[0].bike_id}")
      expect(page).to have_content("Subscription Type: #{trips_array[0].subscription_type}")
      expect(page).to have_content("Zip Code: #{trips_array[0].zip_code}")
      expect(page).to_not have_content("Duration:   #{second_trips_array[0].duration}")
    end
    it 'should show the first 30 trips' do
      trips_array = []
      second_trips_array = []
      30.times {trips_array << create(:trip)}
      32.times {second_trips_array << create(:trip, duration: 2500)}

      visit trips_path(page: 2)

      expect(page).to have_content('All Trips')
      expect(page).to_not have_content("Duration:   #{trips_array[0].duration}")
      expect(page).to have_content("Duration:   #{second_trips_array[0].duration}")
    end
  end

end
