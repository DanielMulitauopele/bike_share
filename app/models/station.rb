class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :dock_count, :city, :installation_date
  validates_uniqueness_of :name
  validates_uniqueness_of :slug

  has_many :start_trips, class_name: 'Trip', foreign_key: 'start_station_id', dependent: :destroy
  has_many :end_trips, class_name: 'Trip', foreign_key: 'end_station_id', dependent: :destroy

  def to_param
    slug
  end

  def self.stations_total_count
    count
  end

  def self.average_docks
    average(:dock_count)
  end

  def self.most_bikes
    maximum(:dock_count)
  end

  def self.most_bikes_station
    order(dock_count: :desc).first.name
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.fewest_bikes_station
    order(:dock_count).first.name
  end

  def self.newest_installation
    order(installation_date: :desc).first.name
  end

  def self.oldest_installation
    order(:installation_date).first.name
  end

  def self.max_starting_station
    select("name, count(trips.id) as count").
    joins('join trips on trips.start_station_id = stations.id').
    group('stations.id').order('count desc').
    limit(1).first.name
  end

  def self.max_ending_station
    select("name, count(trips.id) as count").
    joins('join trips on trips.end_station_id = stations.id').
    group('stations.id').order('count desc').
    limit(1).first.name
  end

  def rides_started
    start_trips.count
  end

  def rides_ended
    end_trips.count
  end

  def most_trips_to
    Station.select(:name)
    .joins("join trips on trips.end_station_id = stations.id")
    .where("trips.start_station_id = ?", id)
    .group(:id)
    .order("count(end_station_id) desc").first.name
  end

  def most_trips_from
    Station.select(:name)
    .joins("join trips on trips.start_station_id = stations.id")
    .where("trips.end_station_id = ?", id)
    .group(:id)
    .order("count(start_station_id) desc").first.name
  end

  def date_with_highest_number
    start_trips.select("trips.start_date, count(trips.start_station_id) as count")
    .where("trips.start_station_id = ?", id)
    .group(:start_date)
    .order("count").last.start_date
  end

  def frequent_zip_code
    start_trips.select('trips.zip_code, count(trips.id) as count')
    .group('trips.zip_code')
    .order('count').last.zip_code
  end

  def frequent_bike_id
    start_trips.select('bike_id, count(start_station_id) as count')
    .group(:bike_id)
    .order('count').last.bike_id
  end
end
