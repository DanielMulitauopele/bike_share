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
      @station_2 = Station.create(name: 'Yale St', dock_count: 10, city: 'Englewood', installation_date: '09/02/2018')
      @station_3 = Station.create(name: 'Union Station', dock_count: 4, city: 'Denver', installation_date: '09/03/2018')
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
      expected = 10
      actual = Station.most_bikes

      expect(actual).to eq(expected)
    end

    it 'returns name of station with most bikes' do
      expected = [@station_1.name, @station_2.name]
      actual = Station.most_bikes_station

      expect(actual).to eq(expected)
    end

    it 'returns fewest bikes at a station' do
      expected = 4
      actual = Station.fewest_bikes

      expect(actual).to eq(expected)
    end

    it 'returns name of station with fewest bikes' do
      expected = [@station_3.name, @station_4.name]
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

  describe 'instance methods' do
    before(:each) do
      @station_1 = Station.create!(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '2018/08/01')
      @station_2 = Station.create!(name: 'Yale St', dock_count: 20, city: 'Englewood', installation_date: '2018/08/01')
      @station_3 = Station.create!(name: 'Broadway', dock_count: 15, city: 'Englewood', installation_date: '2018/08/01')

      @trip_1 = Trip.create!(duration: 100, start_date: '2018/09/01', start_station_id: 1, end_date: '2018/09/01', end_station_id: 2, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_2 = Trip.create!(duration: 120, start_date: '2018/09/01', start_station_id: 2, end_date: '2018/09/01', end_station_id: 1, bike_id: 2, subscription_type: 'expensive', zip_code: 98765)
      @trip_3 = Trip.create!(duration: 80, start_date: '2018/09/02', start_station_id: 1, end_date: '2018/09/02', end_station_id: 2, bike_id: 3, subscription_type: 'expensive', zip_code: 98765)
      @trip_4 = Trip.create!(duration: 140, start_date: '2018/09/02', start_station_id: 2, end_date: '2018/09/02', end_station_id: 1, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_5 = Trip.create!(duration: 60, start_date: '2018/09/03', start_station_id: 1, end_date: '2018/09/03', end_station_id: 2, bike_id: 5, subscription_type: 'expensive', zip_code: 98765)
      @trip_6 = Trip.create!(duration: 160, start_date: '2018/09/03', start_station_id: 2, end_date: '2018/09/03', end_station_id: 1, bike_id: 6, subscription_type: 'cheap', zip_code: 29765)
      @trip_7 = Trip.create!(duration: 160, start_date: '2018/09/04', start_station_id: 1, end_date: '2018/09/04', end_station_id: 2, bike_id: 4, subscription_type: 'cheap', zip_code: 29765)
      @trip_8 = Trip.create!(duration: 80, start_date: '2018/09/05', start_station_id: 3, end_date: '2018/09/05', end_station_id: 3, bike_id: 3, subscription_type: 'expensive', zip_code: 98765)
      @trip_9 = Trip.create!(duration: 140, start_date: '2018/09/06', start_station_id: 3, end_date: '2018/09/06', end_station_id: 3, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_10 = Trip.create!(duration: 60, start_date: '2018/09/06', start_station_id: 3, end_date: '2018/09/06', end_station_id: 3, bike_id: 5, subscription_type: 'expensive', zip_code: 98765)
      @trip_11 = Trip.create!(duration: 160, start_date: '2018/09/06', start_station_id: 1, end_date: '2018/09/06', end_station_id: 3, bike_id: 6, subscription_type: 'cheap', zip_code: 29765)
      @trip_12 = Trip.create!(duration: 160, start_date: '2018/09/06', start_station_id: 1, end_date: '2018/09/06', end_station_id: 3, bike_id: 4, subscription_type: 'cheap', zip_code: 98765)
    end

    it "#rides_started" do
      expect(@station_1.rides_started).to eq(6)
    end

    it "#rides_ended" do
      expect(@station_1.rides_ended).to eq(3)
    end

    it "#most_trips_to" do
      expect(@station_1.most_trips_to).to eq('Yale St')
    end

    it "#most_trips_from" do
      expect(@station_1.most_trips_from).to eq('Yale St')
    end

    it "#date_with_highest_number" do
      expect(@station_1.date_with_highest_number).to eq('2018/09/06')
    end

    it "#frequent_zip_code" do
      expect(@station_1.frequent_zip_code).to eq(98765)
    end

    it "#frequent_bike_id" do
      expect(@station_1.frequent_bike_id).to eq(4)
    end
  end
end
