require 'rails_helper' 

describe 'Admin' do 
  it 'can create a new station' do 
    admin = create(:user, role: 1)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    name = 'Wash Park West' 
    dock_count = 10 
    city = 'Denver' 
    installation_date = '09/01/2018'
    
    visit new_admin_station_path
    
    fill_in :station_name, with: name
    fill_in :station_dock_count, with: dock_count
    fill_in :station_city, with: city
    fill_in :station_installation_date, with: installation_date
    click_on 'Submit' 
    
    expect(current_path).to eq('/wash-park-west')
    expect(page).to have_content(Station.last.name)
    expect(page).to have_content(Station.last.dock_count)
    expect(page).to have_content(Station.last.city)
    expect(page).to have_content(Station.last.installation_date)
  end 
  
  it 'can not create station if invalid entry' do 
    admin = create(:user, role: 1)
    station = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '2018/09/01')
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    name = 'Wash Park East' 
    dock_count = 10 
    city = 'Denver' 
    installation_date = '09/01/2018'
    
    visit new_admin_station_path
    
    fill_in :station_name, with: name
    fill_in :station_dock_count, with: dock_count
    fill_in :station_city, with: city
    fill_in :station_installation_date, with: installation_date
    click_on 'Submit' 
    
    expect(current_path).to eq(admin_stations_path)
    expect(page).to have_content('Oops, something went wrong, please try again!')
  end 
end 