require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:dock_count) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:installation_date) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:slug) }
  end
  
  describe 'relationships' do
    it { should have_many(:start_trips) }
    it { should have_many(:end_trips) }
  end

  describe 'class methods' do
    before :each do
      @station_1 = Station.create(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station_2 = Station.create(name: 'Yale St', dock_count: 8, city: 'Englewood', installation_date: '09/02/2018')
      @station_3 = Station.create(name: 'Union Station', dock_count: 6, city: 'Denver', installation_date: '09/03/2018')
      @station_4 = Station.create(name: 'Market Street', dock_count: 4, city: 'Denver', installation_date: '09/04/2018')
    end
    
    it 'calculates total count of stations' do
      expected = 4
      actual = Station.stations_total_count

      expect(actual).to eq(expected)
    end
    
    it 'calculates average bike per station' do
      expected = 7
      actual = Station.average_docks
  
      expect(actual).to eq(expected)
    end
  
    it 'returns most bikes at a station' do
      expected = @station_1.dock_count 
      actual = Station.most_bikes
  
      expect(actual).to eq(expected)
    end
    
    it 'returns name of station with most bikes' do
      expected = @station_1.name 
      actual = Station.most_bikes_station  
    
      expect(actual).to eq(expected)
    end
  
    it 'returns fewest bikes at a station' do
      expected = @station_4.dock_count 
      actual = Station.fewest_bikes
  
      expect(actual).to eq(expected)
    end
  
    it 'returns name of station with fewest bikes' do
      expected = @station_4.name 
      actual = Station.fewest_bikes_station  
    end
  
    it 'returns recently installed station' do
      expected = @station_4.name
      actual = Station.newest_installation
  
      expect(actual).to eq(expected)
    end
  
    it 'find oldest installation station' do
      expected = @station_1.name
      actual = Station.oldest_installation
  
      expect(actual).to eq(expected)
    end
  end
end