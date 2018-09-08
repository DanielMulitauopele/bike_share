require 'rails_helper'

describe 'Visit Trips Index' do
  context 'As a visitor' do
    it 'should show the first 30 trips' do

      visit trips_path

      expect(page).to have_content('All Trips')

    end
  end

end
