# require 'rails_helper' 
# 
# describe 'Stations-Dashboard' do 
#   describe 'As a registered user'
#   it 'should see stations_dashboard' do 
#     before :each do
#       user = create(:user)
#       @station_1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
#       @station_2 = Station.create(name: 'Yale St', dock_count: 10, city: 'Englewood', installation_date: '09/02/2018')
#       @station_3 = Station.create(name: 'Union Station', dock_count: 8, city: 'Denver', installation_date: '09/03/2018')
#       @station_3 = Station.create(name: 'Market Street', dock_count: 8, city: 'Denver', installation_date: '09/04/2018')
# 
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#     end
# 
#     it 'should see total count of stations' do
# 
#       visit stations_dashboard_path
# 
#       expect(page).to have_content("Total count of stations : #{4}")
#     end
# 
#     it 'should see Average bikes available per station' do
# 
#       visit stations_dashboard_path
# 
#       expect(page).to have_content("Average bikes available per station : #{9}")
#     end
# 
#     it 'should see most bikes available at a station and the station(s) name(s)' do
# 
#       visit stations_dashboard_path
# 
#       expect(page).to have_content("Most bikes available at a station : #{@station_1.dock_count} #{@station_2.dock_count}")
#       expect(page).to have_content(@station_1.name)
#       expect(page).to have_content(@station_2.name)
#     end
# 
#     it 'should see fewest bikes available at a station and the station(s) name(s)' do
# 
#       visit stations_dashboard_path
# 
#       expect(page).to have_content("Fewest bikes available at a station : #{@station_3.dock_count} #{@station_4.dock_count}")
#       expect(page).to have_content(@station_3.name)
#       expect(page).to have_content(@station_4.name)  
#     end
# 
#     it 'should see most recently installed station' do 
# 
#       visit stations_dashboard_path
# 
#       expect(page).to have_content("Newest station : #{@station_4.name}")
#     end
# 
# 
#     it 'should see the oldest station' do
# 
#       visit stations_dashboard_path
# 
#       expect(page).to have_content("Oldest station : #{@station_1.name}")
#     end
#   end
# end