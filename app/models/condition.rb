class Condition < ApplicationRecord
  validates_presence_of :date, :max_temperature, :mean_temperature, :min_temperature, :mean_humidity, :mean_visibility, :mean_wind_speed, :precipitation

  def self.max_day_weather(max_day)
    find_by(date: max_day.day)
  end

  def self.min_day_weather(min_day)
    find_by_date(min_day.day)
  end
end
