require 'rails_helper'

describe 'as a user' do
  describe 'visiting order show page' do
    it "should display order details on the order show page" do
      accessory_1 = create(:accessory)
      accessory_2 = create(:accessory, title: 'an accessory')
      accessory_3 = create(:accessory, title: 'an accessory again')
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit bike_shop_path

      within("#accessory-#{accessory_1.id}") do
        click_on 'Add to Cart'
      end
      within("#accessory-#{accessory_1.id}") do
        click_on 'Add to Cart'
      end
      within("#accessory-#{accessory_3.id}") do
        click_on 'Add to Cart'
      end
      within('#Cart-Header') do
        click_on 'Cart'
      end

      click_on 'Checkout'
      expect(current_path).to eq(dashboard_path)

      click_on 'Order Number: 1'

      expect(current_path).to eq(order_path(user.orders.first))
      expect(page).to have_content("Order #{user.orders.first.id} Details")

      within '.accessory-1' do
        expect(page).to have_content(accessory_1.title)
        expect(page).to have_content("Subtotal: $60.00")
        expect(page).to have_content("Quantity: 2")
      end

      expect(page).to have_content('Order Total')
      expect(page).to have_content('Status')
      expect(page).to have_content('Created')
      expect(page).to have_content('Updated')
    end
  end
end
