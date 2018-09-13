require 'rails_helper'

describe 'Admin' do 
  it 'can see all stations' do
    station_1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
    station_2 = Station.create(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')
    admin = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '12345', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_stations_path

    expect(page).to have_link(station_1.name)
    expect(page).to have_content(station_1.dock_count)
    expect(page).to have_content(station_1.city)
    expect(page).to have_content(station_1.installation_date)
    expect(page).to have_link(station_2.name)
    expect(page).to have_content(station_2.dock_count)
    expect(page).to have_content(station_2.city)
    expect(page).to have_content(station_2.installation_date)
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end

context "as default user" do
  it 'does not allow default user to see admin stations index' do
    user = User.create(name: 'Hans', email: 'hans@email.com', password: 'Test123', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_stations_path

    expect(page).to_not have_content('All Admin Stations')
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end