require 'rails_helper'

describe 'registered user sees one station' do
  describe 'they link from stations index' do
    before(:each) do
      @user = User.create(email: 'tara@gmail.com', password: 'password')
      @station_1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station_2 = Station.create(name: 'Yale St', dock_count: 20, city: 'Englewood', installation_date: '08/01/2018')

      @trip_1 = Trip.create(duration: 100, start_date: '09/01/2018', start_station_id: 1, end_date: '09/01/2018', end_station_id: 2, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_2 = Trip.create(duration: 120, start_date: '09/01/2018', start_station_id: 2, end_date: '09/02/2018', end_station_id: 1, bike_id: 2, subscription_type: 'expensive', zip_code: 98765)
      @trip_3 = Trip.create(duration: 80, start_date: '09/03/2018', start_station_id: 1, end_date: '09/03/2018', end_station_id: 2, bike_id: 3, subscription_type: 'expensive', zip_code: 98765)
      @trip_4 = Trip.create(duration: 140, start_date: '09/04/2018', start_station_id: 2, end_date: '09/04/2018', end_station_id: 1, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_5 = Trip.create(duration: 60, start_date: '09/05/2018', start_station_id: 1, end_date: '09/05/2018', end_station_id: 2, bike_id: 5, subscription_type: 'expensive', zip_code: 98765)
      @trip_6 = Trip.create(duration: 160, start_date: '09/06/2018', start_station_id: 2, end_date: '09/06/2018', end_station_id: 1, bike_id: 6, subscription_type: 'cheap', zip_code: 29765)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "displays one station" do
      visit stations_path

      click_on @station_1.name
      expect(current_path).to eq('/stations/wash-park-east')
      expect(page).to have_content(@station_1.name)
      expect(page).to have_content(@station_1.dock_count)
      expect(page).to have_content(@station_1.city)
      expect(page).to have_content(@station_1.installation_date)
      expect(page).to have_content("Number of rides started at this station: 3")
      expect(page).to have_content("Number of rides ended at this station: 3")
      # expect(page).to have_content("Most frequent destination station: #{@station_2.name}")
      # expect(page).to have_content("Most frequent origination station: #{@station_2.name}")
      # expect(page).to have_content("Date with the highest number of trips started at this station: 09/01/2018")
      # expect(page).to have_content("Most frequent zip code for users starting trips at this station: 98765")
      # expect(page).to have_content("Bike ID most frequently starting a trip at this station: 1")
    end
  end
end
