FactoryBot.define do
  factory :condition do
      date {'2018-09-02'}
      max_temperature {74.0}
      mean_temperature {68.0}
      min_temperature {61.0}
      mean_humidity {75.0}
      mean_visibility {10.0}
      mean_wind_speed {11.0}
      precipitation {0}
  end
end
