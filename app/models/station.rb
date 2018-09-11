class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :dock_count, :city, :installation_date
  validates_uniqueness_of :name
  validates_uniqueness_of :slug

  has_many :start_trips, class_name: 'Trip', foreign_key: 'start_station_id', dependent: :destroy
  has_many :end_trips, class_name: 'Trip', foreign_key: 'end_station_id', dependent: :destroy

  def rides_started
    start_trips.count
  end
end
