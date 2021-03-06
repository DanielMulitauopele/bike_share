require 'rails_helper'

describe 'visitor sees one station' do
  describe 'they link from stations index' do
    before(:each) do
      @station = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '2018/09/01')
    end

    it "displays one station" do
      visit stations_path

      click_on @station.name

      expect(current_path).to eq('/wash-park-east')
      expect(page).to have_content(@station.name)
      expect(page).to have_content(@station.dock_count)
      expect(page).to have_content(@station.city)
      expect(page).to have_content(@station.installation_date)
    end
  end
end
