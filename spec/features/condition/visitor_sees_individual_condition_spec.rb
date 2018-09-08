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
  end
end
