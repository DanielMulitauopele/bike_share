FactoryBot.define do
  factory :trip do
    duration {100}
    start_date {Time.now}
    start_station {1}
    end_date {Time.now}
    end_station {2}
    bike_id {1}
    subscription_type {'cheap'}
    zip_code {1}
  end
end

