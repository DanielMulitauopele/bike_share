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

      expect(page).to have_content("Total count of stations: #{Station.count}")
    end

    it 'should see Average bikes available per station' do

      visit stations_dashboard_path

      expect(page).to have_content("Average bikes available per station: #{Station.average_docks}")
    end

    it 'should see most bikes available at a station and the station(s) name(s)' do

      visit stations_dashboard_path

      expect(page).to have_content("Station(s) with the most bikes available: #{Station.most_bikes_station.first} : #{Station.most_bikes}")
    end

    it 'should see fewest bikes available at a station and the station(s) name(s)' do

      visit stations_dashboard_path

      expect(page).to have_content("Station(s) with fewest bikes available: #{Station.fewest_bikes_station.first} : #{Station.fewest_bikes}")
    end

    it 'should see most recently installed station' do

      visit stations_dashboard_path

      expect(page).to have_content("Most recently installed station: #{Station.newest_installation}")
    end

    it 'should see the oldest station' do

      visit stations_dashboard_path

      expect(page).to have_content("Oldest station: #{Station.oldest_installation}")
    end
  end
end
