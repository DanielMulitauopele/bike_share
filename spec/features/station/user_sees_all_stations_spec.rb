describe 'user sees all stations' do
  before(:each) do
    @station1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
    @station2 = Station.create(name: 'Yale St', dock_count: 5, city: 'Englewood', installation_date: '09/02/2018')
  end
    
  it 'they can not edit or delete stations as a regular user' do  
    user = create(:user)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit stations_path

    expect(page).to have_link(@station1.name)
    expect(page).to have_content(@station1.dock_count)
    expect(page).to have_content(@station1.city)
    expect(page).to have_content(@station1.installation_date)
    expect(page).to have_link(@station2.name)
    expect(page).to have_content(@station2.dock_count)
    expect(page).to have_content(@station2.city)
    expect(page).to have_content(@station2.installation_date)
    expect(page).to_not have_content('Edit')
    expect(page).to_not have_content('Delete')
  end
  
  describe 'As an admin' do  
    it 'they can edit or delete stations' do  
      admin = create(:user, role: 1)
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit stations_path

      expect(page).to have_link(@station1.name)
      expect(page).to have_content(@station1.dock_count)
      expect(page).to have_content(@station1.city)
      expect(page).to have_content(@station1.installation_date)
      expect(page).to have_link(@station2.name)
      expect(page).to have_content(@station2.dock_count)
      expect(page).to have_content(@station2.city)
      expect(page).to have_content(@station2.installation_date)
      expect(page).to have_content('Edit')
      expect(page).to have_content('Delete')
    end
  end
end
