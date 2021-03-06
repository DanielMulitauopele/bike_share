require 'rails_helper'

describe 'visitor sees all stations' do
  describe 'they visit stations index' do
    before(:each) do
      @station1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station2 = Station.create(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')
      
    end
    it "displays all stations" do
      visit stations_path

      expect(page).to have_link(@station1.name)
      expect(page).to have_content(@station1.dock_count)
      expect(page).to have_content(@station1.city)
      expect(page).to have_content(@station1.installation_date)
      expect(page).to have_link(@station2.name)
      expect(page).to have_content(@station2.dock_count)
      expect(page).to have_content(@station2.city)
      expect(page).to have_content(@station2.installation_date)
    end
  end
end
