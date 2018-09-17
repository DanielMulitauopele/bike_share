require 'rails_helper'

describe 'Admin' do
  describe 'can edit order status' do
    before (:each) do
      @accessory_1 = create(:accessory)
      @accessory_2 = create(:accessory, title: 'An accessory')
      @accessory_3 = create(:accessory, title: 'An accessory again')
      @admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
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
      find('#Cart-Header').click

      click_on 'Checkout'
      @order = @admin.orders.first.id
    end

    it 'they link from the admin dashboard' do
      visit admin_dashboard_path

      click_on 'Edit'

      expect(current_path).to eq(edit_admin_order_path(@order))

      select "Canceled", from: "order[status]"
      click_on 'Submit'

      expect(current_path).to eq(order_path(@order))
      expect(page).to have_content('Status: Canceled')
      expect(page).to have_content("Order #{@order} updated successfully!")
    end
  end
end
