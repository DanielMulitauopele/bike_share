require 'rails_helper'

describe 'as a user' do
  describe 'visiting order edit page' do
    before (:each) do
      @accessory_1 = create(:accessory)
      @accessory_2 = create(:accessory, title: 'An accessory')
      @accessory_3 = create(:accessory, title: 'An accessory again')
      @user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit bike_shop_path

      within("#accessory-#{@accessory_1.id}") do
        click_on 'Add to Cart'
      end
      within("#accessory-#{@accessory_2.id}") do
        click_on 'Add to Cart'
      end
      within("#accessory-#{@accessory_3.id}") do
        click_on 'Add to Cart'
      end
      within('#Cart-Header') do
        click_on 'Cart'
      end

      click_on 'Checkout'
      @order = @user.orders.first.id
    end
    it "should take user to order edit page" do
      visit dashboard_path

      click_on 'Edit'

      expect(current_path).to eq(edit_order_path(@order))
      expect(page).to have_content("Edit Order #{@order}")
    end
    it "should allow user to edit status" do
      visit dashboard_path

      click_on 'Edit'

      expect(current_path).to eq(edit_order_path(@order))
      expect(page).to have_content("Edit Order #{@order}")

      select "Canceled", from: "order[status]"
      click_on 'Update Order'

      visit order_path(1)
      expect(page).to have_content('Status: Canceled')
    end
  end
end
