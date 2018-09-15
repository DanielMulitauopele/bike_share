require 'rails_helper'

describe 'Admin' do  
  before(:each) do
    @admin = create(:user, role: 1)
  end
  
  it 'can edit a station' do
    station = Station.create(name: 'Wash Park East', id: 1, dock_count: 10, city: 'Denver', installation_date: '2018/09/01')
    new_name = 'Jump Street' 
    new_dock_count = 12 
    new_city = 'Boulder' 
    new_installation_date = '2018-12-14'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    
    visit edit_admin_station_path(station)
  
    fill_in :station_name, with: new_name
    fill_in :station_dock_count, with: new_dock_count
    fill_in :station_city, with: new_city
    fill_in :station_installation_date, with: new_installation_date
    click_on 'Submit' 
  
    expect(current_path).to eq('/jump-street')
    expect(page).to have_content("successfully updated station #{new_name}.")
    expect(page).to have_content(new_name)
    expect(page).to have_content(new_dock_count)
    expect(page).to have_content(new_city)
    expect(page).to have_content(new_installation_date)
    expect(page).to_not have_content(station.name)
    expect(page).to_not have_content(station.dock_count)
    expect(page).to_not have_content(station.city)
    expect(page).to_not have_content(station.installation_date)
  end 

  it 'can not create station if invalid entry' do 
    station_1 = Station.create(name: 'Wash Park East', id: 1, dock_count: 10, city: 'Denver', installation_date: '2018/09/01')
    station_2 = Station.create(name: 'Yale', id: 2, dock_count: 10, city: 'Denver', installation_date: '2018/09/01')
  
    new_name = 'Wash Park East' 
    new_dock_count = 12 
    new_city = 'Boulder' 
    new_installation_date = '2018-12-14'
  
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  
    visit edit_admin_station_path(station_2)
    
  
    fill_in :station_name, with: new_name
    fill_in :station_dock_count, with: new_dock_count
    fill_in :station_city, with: new_city
    fill_in :station_installation_date, with: new_installation_date
    
    click_on 'Submit' 
  
    expect(current_path).to eq(admin_station_path(station_2))
    expect(page).to have_content('Oops, something went wrong, please try again!')
  end 
end 