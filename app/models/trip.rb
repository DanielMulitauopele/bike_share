class Trip < ApplicationRecord
  validates_presence_of :duration,
                        :start_date,
                        :end_date,
                        :bike_id,
                        :subscription_type,
                        :start_station_id,
                        :end_station_id

  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"

  COLUMN_MAP = {temp:   'max_temperature',
                wind:   'mean_wind_speed',
                precip: 'precipitation',
                vis:    'mean_visibility'}

  def duration_minutes
    duration / 60
  end
  def self.average_duration
    average(:duration)
  end

  def self.longest_ride
    select(:id, :start_date, :duration).where(duration: maximum(:duration))
  end

  def self.shortest_ride
    select(:id, :start_date, :duration).where(duration: minimum(:duration))
  end

  def self.group_by_month_year
    select("DATE_TRUNC('month', start_date) as my, count(id) as count").group('my').order('my asc')
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

  def self.max_by(range, type)
    column_name = COLUMN_MAP[type]
    select("DATE_TRUNC('day',start_date) as start_date, count(trips.id) as count")
    .joins("join conditions on DATE_TRUNC('day', conditions.date) = DATE_TRUNC('day', trips.start_date)")
    .where("#{column_name} between ? and ?", range.first, range.last)
    .group("DATE_TRUNC('day', start_date)")
    .order("count desc").limit(1).first
  end

  def self.min_by(range, type)
    column_name = COLUMN_MAP[type]
    select("DATE_TRUNC('day',start_date) as start_date, count(trips.id) as count")
    .joins("join conditions on DATE_TRUNC('day', conditions.date) = DATE_TRUNC('day', trips.start_date)")
    .where("#{column_name} between ? and ?", range.first, range.last)
    .group("DATE_TRUNC('day', start_date)")
    .order("count asc").limit(1).first
  end

  def self.avg_by(range, type)
    column_name = COLUMN_MAP[type]
    count_of_trips = select("distinct trips.id")
           .joins("join conditions on date_trunc('day', conditions.date) = date_trunc('day', trips.start_date)")
            .where("#{column_name} between ? and ?", range.first, range.last).count
    total_trips = Trip.count
    avg = ((count_of_trips.to_f / total_trips) * 100) unless count_of_trips == 0
    avg ||= 0
  end


end
