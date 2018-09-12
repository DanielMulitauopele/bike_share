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

  describe 'instance methods' do
    before(:each) do
      @station_1 = Station.create!(name: 'Wash Park East', dock_count: 10, city: 'Denver', installation_date: '09/01/2018')
      @station_2 = Station.create!(name: 'Yale St', dock_count: 20, city: 'Englewood', installation_date: '08/01/2018')
      @station_3 = Station.create!(name: 'Broadway', dock_count: 15, city: 'Englewood', installation_date: '08/01/2018')

      @trip_1 = Trip.create!(duration: 100, start_date: '09/01/2018', start_station_id: 1, end_date: '09/01/2018', end_station_id: 2, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_2 = Trip.create!(duration: 120, start_date: '09/01/2018', start_station_id: 2, end_date: '09/02/2018', end_station_id: 1, bike_id: 2, subscription_type: 'expensive', zip_code: 98765)
      @trip_3 = Trip.create!(duration: 80, start_date: '09/03/2018', start_station_id: 1, end_date: '09/03/2018', end_station_id: 2, bike_id: 3, subscription_type: 'expensive', zip_code: 98765)
      @trip_4 = Trip.create!(duration: 140, start_date: '09/04/2018', start_station_id: 2, end_date: '09/04/2018', end_station_id: 1, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_5 = Trip.create!(duration: 60, start_date: '09/05/2018', start_station_id: 1, end_date: '09/05/2018', end_station_id: 2, bike_id: 5, subscription_type: 'expensive', zip_code: 98765)
      @trip_6 = Trip.create!(duration: 160, start_date: '09/06/2018', start_station_id: 2, end_date: '09/06/2018', end_station_id: 1, bike_id: 6, subscription_type: 'cheap', zip_code: 29765)
      @trip_7 = Trip.create!(duration: 160, start_date: '09/06/2018', start_station_id: 1, end_date: '09/06/2018', end_station_id: 2, bike_id: 4, subscription_type: 'cheap', zip_code: 29765)
      @trip_8 = Trip.create!(duration: 80, start_date: '09/03/2018', start_station_id: 3, end_date: '09/03/2018', end_station_id: 3, bike_id: 3, subscription_type: 'expensive', zip_code: 98765)
      @trip_9 = Trip.create!(duration: 140, start_date: '09/04/2018', start_station_id: 3, end_date: '09/04/2018', end_station_id: 3, bike_id: 1, subscription_type: 'cheap', zip_code: 98765)
      @trip_10 = Trip.create!(duration: 60, start_date: '09/05/2018', start_station_id: 3, end_date: '09/05/2018', end_station_id: 3, bike_id: 5, subscription_type: 'expensive', zip_code: 98765)
      @trip_11 = Trip.create!(duration: 160, start_date: '09/06/2018', start_station_id: 1, end_date: '09/06/2018', end_station_id: 3, bike_id: 6, subscription_type: 'cheap', zip_code: 29765)
      @trip_12 = Trip.create!(duration: 160, start_date: '09/06/2018', start_station_id: 1, end_date: '09/06/2018', end_station_id: 3, bike_id: 4, subscription_type: 'cheap', zip_code: 29765)
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
  end
end
