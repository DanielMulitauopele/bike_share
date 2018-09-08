require 'rails_helper'

describe 'as a visitor' do
  describe 'visiting condition show page' do
    before(:each) do
      @condition = create(:condition, id: 1)
    end
    it 'should link to specific condition from index page' do
      visit conditions_path

      click_on("Date: #{@condition.date}")
      expect(page).to have_content(header)
    end
  end
end
