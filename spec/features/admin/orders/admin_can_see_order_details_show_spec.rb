require 'rails_helper'

describe 'as a admin' do
  describe 'visiting order show page' do
    it "should display order details on the order show page" do
      accessory_1 = create(:accessory)
      accessory_3 = create(:accessory, title: 'an accessory again')
      sum = accessory_1.price + accessory_3.price
      user = create(:user)
      order = Order.create(status: 'Ordered', total: sum, user_id: 1)
      order.order_accessories.create(accessory: accessory_1)
      order.order_accessories.create(accessory: accessory_3)

      admin = create(:user, role: 1, email: '111')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit order_path(order)

      expect(page).to have_content("Order #{user.orders.first.id} Details")

      within '.accessory-1' do
        expect(page).to have_content(accessory_1.title)
        expect(page).to have_content("Subtotal: $30.00")
        expect(page).to have_content("Quantity: 1")
      end

      expect(page).to have_content('Order Total: $60.00')
      expect(page).to have_content('Status: Ordered')
      expect(page).to have_content('Created')
      expect(page).to have_content('Updated')

      expect(page).to have_content(user.name)
      expect(page).to have_content(user.address)
    end
  end
end
