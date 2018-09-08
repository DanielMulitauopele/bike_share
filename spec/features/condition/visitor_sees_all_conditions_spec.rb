require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting conditions index page' do
    before(:each) do
      @condition = create(:condition, id: 1)
    end
    it 'should list out all conditions' do
      header = "All Conditions"
      visit conditions_path

      expect(page).to have_content(header)
      expect(page).to have_content("Date: #{@condition.date}")
      save_and_open_page
      within('.condition-number-1') do
        expect(page).to have_content("Max Temperature: #{@condition.max_temperature}")
        expect(page).to have_content("Mean Temperature: #{@condition.mean_temperature}")
        expect(page).to have_content("Min Temperature: #{@condition.min_temperature}")
        expect(page).to have_content("Mean Humidity: #{@condition.mean_humidity}")
        expect(page).to have_content("Mean Visibility: #{@condition.mean_visibility}")
        expect(page).to have_content("Mean Wind Speed: #{@condition.mean_wind_speed}")
        expect(page).to have_content("Precipitation: #{@condition.precipitation}")
      end
    end
  end
end
