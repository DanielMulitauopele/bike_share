require 'rails_helper'

describe 'Admin' do
  it 'can delete a station from index' do
    admin = create(:user, role: 1)
    station = Station.create(name: 'Wash Park East', id: 1, dock_count: 10, city: 'Denver', installation_date: '2018/09/01')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stations_path
    within("#station-#{station.id}") do
      click_on 'Delete'
    end

    expect(page).to_not have_content(station.name)
  end

  it 'can delete a station from show' do
    admin = create(:user, role: 1)
    station = Station.create(name: 'Wash Park East', id: 1, dock_count: 10, city: 'Denver', installation_date: '2018/09/01')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit station_path(station)

    click_on 'Delete'

    expect(current_path).to eq(stations_path)
    expect(page).to_not have_content(station.name)
  end
end
