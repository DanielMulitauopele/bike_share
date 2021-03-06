require 'rails_helper'

describe 'as a user' do
  describe 'viewing dashboard page' do
    it "should list out orders" do
      user = create(:user)
      order_1 = user.orders.create(id: 1, total: 297.34, status: 'paid')
      order_2 = user.orders.create(id: 2, total: 327.56, status: 'ordered')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_link("Order Number: #{order_1.id}")
      expect(page).to have_link("Order Number: #{order_2.id}")
    end
    
    it "should take visitor to order show page" do
      user = create(:user)
      order_1 = user.orders.create(id: 1, total: 297.34, status: 'paid')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path
      expect(page).to have_link("Order Number: #{order_1.id}")

      click_on 'Order Number: 1'

      expect(current_path).to eq(order_path(order_1.id))
      expect(page).to have_content("Order #{order_1.id} Details")
    end
  end
end
