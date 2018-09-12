require 'rails_helper'

describe 'as a user' do
  describe 'visiting order show page' do
    it "should show the details of the order" do
      user = create(:user)
      order_1 = user.orders.create(id: 1, total: 297.34, status: 'paid', datetime: "11/04/17 23:00")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit order_path(user)

      expect(page).to have_content("Order #{order_1.id} Details")
      expect(page).to have_content('Accessory')
      expect(page).to have_content('Subtotal')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Order Total')
      expect(page).to have_content('Status')
      expect(page).to have_content('Date/Time')
    end
  end
end
