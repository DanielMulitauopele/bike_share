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
describe 'as an admin' do
  describe 'visiting conditions index page' do
    before(:each) do
      @condition = create(:condition, id: 1)
    end
    it 'should delete a conditon' do

      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit conditions_path

      within('.condition-number-1') do
        click_on 'Delete'
      end

      expect(page).to have_content("Successfully deleted #{@condition.date}")
      expect(page).to_not have_content("Max Temperature: #{@condition.max_temperature}")

    end
    it 'should edit a conditon' do
      temp = 1000

      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit conditions_path

      within('.condition-number-1') do
        click_on 'Edit'
      end

      fill_in 'condition[max_temperature]', with: temp
      fill_in 'condition[min_temperature]', with: temp
      fill_in 'condition[mean_temperature]', with: temp
      fill_in 'condition[mean_humidity]', with: temp
      fill_in 'condition[mean_visibility]', with: temp
      fill_in 'condition[mean_wind_speed]', with: temp
      fill_in 'condition[precipitation]', with: temp
      click_on 'Submit'

      expect(page).to have_content("Max Temperature: #{temp}")
      expect(page).to have_content("Mean Temperature: #{temp}")
      expect(page).to have_content("Min Temperature: #{temp}")
      expect(page).to have_content("Mean Humidity: #{temp}")
      expect(page).to have_content("Mean Visibility: #{temp}")
      expect(page).to have_content("Mean Wind Speed: #{temp}")
      expect(page).to have_content("Precipitation: #{temp}")

    end
  end
end
