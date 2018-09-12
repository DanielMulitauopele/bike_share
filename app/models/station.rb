class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :dock_count, :city, :installation_date
  validates_uniqueness_of :name
  validates_uniqueness_of :slug

 has_many :start_trips, class_name: 'Trip', foreign_key: 'start_station_id', dependent: :destroy
has_many :end_trips, class_name: 'Trip', foreign_key: 'end_station_id', dependent: :destroy

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

    def rides_started
      start_trips.count
    end

    def rides_ended
      end_trips.count
  end
end
