describe 'Admin' do
  it "can see one station" do
    station = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '2018/09/01')
    admin = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '12345', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    visit admin_station_path(station)

    expect(current_path).to eq('/admin/stations/wash-park-east')
    expect(page).to have_content(station.name)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.installation_date)
    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end
