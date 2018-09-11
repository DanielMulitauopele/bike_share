require 'rails_helper'

describe 'as a user' do
  describe 'viewing dashboard page' do
    it "should list out orders" do
      user = create(:user)
      order_1 = user.orders.create(id: 1, total: 297.34, status: 'paid', datetime: "11/04/17 23:00")
      order_2 = user.orders.create(id: 2, total: 327.56, status: 'ordered', datetime: "11/04/17 23:00")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      save_and_open_page
      expect(page).to have_link("Order Number: #{order_1.id}")
      expect(page).to have_link("Order Number: #{order_2.id}")
    end
  end
end
