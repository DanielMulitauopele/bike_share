require 'rails_helper'

describe 'as an admin' do
  describe 'visiting dashboard page' do
    before (:each) do
      @accessory_1 = create(:accessory)
      @admin = create(:user, role: 1)
    end
    it "should show all accessories" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path

      save_and_open_page
      expect(page).to have_content('All Accessories')
      expect(page).to have_content(@accessory_1.title)
    end
  end
end
