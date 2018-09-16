require 'rails_helper'

describe 'as an admin' do
  describe 'visiting dashboard page' do
    before (:each) do
      @accessory_1 = create(:accessory)
      @accessory_2 = create(:accessory, title: "Fishing Pole")
      @accessory_3 = create(:accessory, title: "Tennis Racket")
      @admin = create(:user, role: 1)
    end
    it "should show all accessories" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path

      expect(page).to have_content('All Accessories')
      expect(page).to have_content(@accessory_1.title)
    end
    it "should be able to edit an accessory" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path

      within '.accessory-1' do
        click_on 'Edit'
      end

      fill_in :accessory_title, with: "Chicken Pot Pie"
      fill_in :accessory_description, with: "Yummy Yummy"
      fill_in :accessory_price, with: "50"
      select "retired", from: "accessory[status]"

      click_on 'Update Accessory'

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content('All Accessories')
      expect(page).to have_content("Chicken Pot Pie")
      expect(page).to have_content("Yummy Yummy")
      expect(page).to have_content("$50.00")
      expect(page).to have_content("retired")
    end
    it "should show flash message if user does not input correct info" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path

      within '.accessory-1' do
        click_on 'Edit'
      end

      expect(current_path).to eq(edit_admin_accessory_path(@accessory_1))

      fill_in :accessory_title, with: ""
      fill_in :accessory_description, with: "Yummy Yummy"
      fill_in :accessory_price, with: "50"
      select "retired", from: "accessory[status]"

      click_on 'Update Accessory'

      expect(page).to have_content('Something went wrong, please try again.')
      expect(current_path).to eq(admin_accessory_path(@accessory_1))
    end
  end
end