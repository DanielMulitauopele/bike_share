require 'rails_helper'

describe 'Visit Trips Index' do
  context 'As a visitor' do
    before(:each) do
      @trips_array = []
      @second_trips_array = []
      station = create(:station)
      30.times {@trips_array << create(:trip, start_station_id: station.id, end_station_id: station.id)}
      32.times {@second_trips_array << create(:trip, duration: 3500, start_station_id: station.id, end_station_id: station.id)}
    end

    it 'should show the first 30 trips' do

      visit trips_path

      within '#trip-1' do
        expect(page).to have_content(@trips_array[0].duration)
        expect(page).to have_content(@trips_array[0].start_date)
        expect(page).to have_content(@trips_array[0].start_station.name)
        expect(page).to have_content(@trips_array[0].end_date)
        expect(page).to have_content(@trips_array[0].end_station.name)
        expect(page).to have_content(@trips_array[0].bike_id)
        expect(page).to have_content(@trips_array[0].subscription_type)
        expect(page).to have_content(@trips_array[0].zip_code)
        expect(page).to_not have_content(@second_trips_array[0].duration)
      end
    end

    it 'should show the next 30 trips' do

      visit trips_path(page: 2)

      expect(page).to have_content('All Trips')
      expect(page).to have_selector("#trip-31")
    end


    it 'should link to the prior 30 trips' do

      visit trips_path(page: 2)
      click_on 'Previous Page'

      expect(page).to have_content('All Trips')
      expect(page).not_to have_selector("#trip-31")
    end
  end

end
