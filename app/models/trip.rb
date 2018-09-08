class Trip < ApplicationRecord
  validates_presence_of :duration, :start_date, :start_station, :end_date, :bike_id, :subscription_type, :zip_code, :end_station
end
