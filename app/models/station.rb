class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :dock_count, :city, :installation_date
  validates_uniqueness_of :name
  validates_uniqueness_of :slug

  has_many :start_trips, class_name: 'Trip', foreign_key: 'start_station_id', dependent: :destroy
  has_many :end_trips, class_name: 'Trip', foreign_key: 'end_station_id', dependent: :destroy
  
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
    where(dock_count: most_bikes)
  end
  
  def self.fewest_bikes
    minimum(:dock_count)
  end
  
  def self.fewest_bikes_station
     where(dock_count: fewest_bikes)
  end
  
  def self.newest_installation
    order(installation_date: :desc).first.name
  end
  
  def self.oldest_installation
    order(:installation_date).first.name
  end
  
end
