require 'rails_helper'

describe 'Stations-Dashboard' do
  describe 'As a registered user' do
    before :each do
      user = create(:user)
      @station_1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station_2 = Station.create(name: 'Yale St', dock_count: 8, city: 'Englewood', installation_date: '09/02/2018')
      @station_3 = Station.create(name: 'Union Station', dock_count: 6, city: 'Denver', installation_date: '09/03/2018')
      @station_3 = Station.create(name: 'Market Street', dock_count: 4, city: 'Denver', installation_date: '09/04/2018')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'should see total count of stations' do

      visit stations_dashboard_path

      within '#total-stations' do
        expect(page).to have_content(Station.count)
      end
    end

    it 'should see Average bikes available per station' do

      visit stations_dashboard_path

      within '#average-bikes' do
        expect(page).to have_content(Station.average_docks)
      end
    end

    it 'should see most bikes available at a station and the station(s) name(s)' do

      visit stations_dashboard_path

      within '#most-rides-table' do
        expect(page).to have_content(Station.most_bikes_station.first)
        expect(page).to have_content(Station.most_bikes)
      end
    end

    it 'should see fewest bikes available at a station and the station(s) name(s)' do

      visit stations_dashboard_path

      within '#fewest-rides-table' do
        expect(page).to have_content(Station.fewest_bikes_station.first)
        expect(page).to have_content(Station.fewest_bikes)
      end
    end

    it 'should see most recently installed station' do

      visit stations_dashboard_path

      within "#recently-installed" do
        expect(page).to have_content(Station.newest_installation)
      end
    end

    it 'should see the oldest station' do

      visit stations_dashboard_path

      within '#oldest-station' do
        expect(page).to have_content(Station.oldest_installation)
      end
    end
  end
end
