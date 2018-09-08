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
      within('.condition-number-1') do
        expect(page).to have_content(@condition.date)
        expect(page).to have_content(@condition.max_temperature)
        expect(page).to have_content(@condition.mean_temperature)
        expect(page).to have_content(@condition.min_temperature)
        expect(page).to have_content(@condition.mean_humidity)
        expect(page).to have_content(@condition.mean_visibility)
        expect(page).to have_content(@condition.mean_wind_speed)
        expect(page).to have_content(@condition.precipitation)
      end
    end
  end
end
