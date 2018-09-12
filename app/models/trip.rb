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

  def self.most_ridden_bike
   select('bike_id, count(id) as count').
    group('bike_id').
    order('count desc').
    limit(1).first
  end

  def self.least_ridden_bike
   select('bike_id, count(id) as count').
    group('bike_id').
    order('count asc').
    limit(1).first
  end

  def self.distribution_by_subscription
    select("subscription_type, count(id) as count, count(id)::decimal/(select count(id) from trips)*100 as percentage").
    group(:subscription_type).
    order(:subscription_type)
  end

  def self.max_day
    select("DATE_TRUNC('day', start_date) as day, count(id) as count").group('day').order('count desc').limit(1).first
  end

  def self.min_day
    select("DATE_TRUNC('day', start_date) as day, count(id) as count").group('day').order('count asc').limit(1).first
  end
end
