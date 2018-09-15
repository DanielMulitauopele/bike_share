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
  
  def should_generate_new_friendly_id?
    slug.blank? || self.name_changed?
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
    Station.where(dock_count: most_bikes).pluck(:name)
  end

  def self.fewest_bikes
    minimum(:dock_count)
  end

  def self.fewest_bikes_station
    Station.where(dock_count: fewest_bikes).pluck(:name)
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
     station = Station.select(:name)
    .joins("join trips on trips.end_station_id = stations.id")
    .where("trips.start_station_id = ?", id)
    .group(:id)
    .order("count(end_station_id) desc")
     station.first.name unless station.first.nil?
  end

  def most_trips_from
    station = Station.select(:name)
    .joins("join trips on trips.start_station_id = stations.id")
    .where("trips.end_station_id = ?", id)
    .group(:id)
    .order("count(start_station_id) desc")
     station.first.name unless station.first.nil?
  end

  def date_with_highest_number
    station = start_trips.select("trips.start_date, count(trips.start_station_id) as count")
    .where("trips.start_station_id = ?", id)
    .group(:start_date)
    .order("count")
    station.last.start_date unless station.last.nil?
  end

  def frequent_zip_code
    station = start_trips.select('trips.zip_code, count(trips.id) as count')
    .group('trips.zip_code')
    .order('count')
    station.last.zip_code unless station.last.nil?
  end

  def frequent_bike_id
    station = start_trips.select('bike_id, count(start_station_id) as count')
    .group(:bike_id)
    .order('count')
    station.last.bike_id unless station.last.nil?
  end
end
