class Trip < ApplicationRecord
  validates_presence_of :duration,
                        :start_date,
                        :end_date,
                        :bike_id,
                        :subscription_type,
                        :zip_code,
                        :start_station_id,
                        :end_station_id

  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"

  def self.average_duration
    average(:duration)
  end

  def self.longest_ride
    rides = select(:id).where(duration: maximum(:duration))
    rides.map {|ride| ride.id }
  end

  def self.shortest_ride
    rides = select(:id).where(duration: minimum(:duration))
    rides.map {|ride| ride.id }
  end

  def self.group_by_month_year
    group("DATE_TRUNC('month', start_date)").count
  end

  def self.group_by_year
    group("DATE_TRUNC('year', start_date)").count
  end
end
