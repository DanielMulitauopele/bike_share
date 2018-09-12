require 'rails_helper'

describe 'as a user' do
  describe 'visiting order show page' do
    it "should show the details of the order" do
      user = create(:user)
      order_1 = user.orders.create(id: 1, total: 297.34, status: 'paid', datetime: "11/04/17 23:00")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      expect(page).to have_link("Order Number: #{order_1.id}")
    end
  end
end
