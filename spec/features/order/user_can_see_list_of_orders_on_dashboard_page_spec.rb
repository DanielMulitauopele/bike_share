require 'rails_helper'

describe 'as a user' do
  describe 'viewing dashboard page' do
    it "should list out orders" do
      user = create(:user)
      order_1 = user.orders.create(total: 297.34, status: 'paid', datetime: 2001-02-03)
      order_2 = user.orders.create(total: 327.56, status: 'ordered', datetime: 2001-02-03)

      visit user_dashboard_path

      expect(page).to have_link("Order Number: #{order_1.id}")
      expect(page).to have_link("Order Number: #{order_2.id}")
    end
  end
end
