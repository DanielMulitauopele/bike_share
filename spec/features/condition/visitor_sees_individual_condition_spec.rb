require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting condition show page' do
    before(:each) do
      @condition = create(:condition, id: 1)
    end
    
    it 'should link to specific condition from index page' do

      header = "Conditions for #{@condition.date}"
      visit conditions_path

      click_on("Date: #{@condition.date}")
      expect(current_path).to eq(condition_path(@condition))
      expect(page).to have_content(header)
    end
    
    it 'should show the details of a specific condition' do

      visit condition_path(@condition)

      expect(page).to have_content("Max Temperature: #{@condition.max_temperature}")
      expect(page).to have_content("Mean Temperature: #{@condition.mean_temperature}")
      expect(page).to have_content("Min Temperature: #{@condition.min_temperature}")
      expect(page).to have_content("Mean Humidity: #{@condition.mean_humidity}")
      expect(page).to have_content("Mean Visibility: #{@condition.mean_visibility}")
      expect(page).to have_content("Mean Wind Speed: #{@condition.mean_wind_speed}")
      expect(page).to have_content("Precipitation: #{@condition.precipitation}")
    end
    
    it 'should be able to take visitor back to index page' do
      visit condition_path(@condition)

      click_on('Return to All Conditions Page')
      expect(current_path).to eq(conditions_path)
    end
  end
end
