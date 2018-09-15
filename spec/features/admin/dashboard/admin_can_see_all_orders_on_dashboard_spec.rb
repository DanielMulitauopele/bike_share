require 'rails_helper'

describe 'as an admin' do
  describe 'visiting dashboard page' do
    before (:each) do
      @admin = create(:user, role: 1)
      @order_1 = @admin.orders.create!(total: 65, status: 'Paid')
      @order_2 = @admin.orders.create!(total: 65, status: 'Ordered')
      @order_3 = @admin.orders.create!(total: 65, status: 'Cancelled')
      @order_4 = @admin.orders.create!(total: 65, status: 'Cancelled')
      @order_5 = @admin.orders.create!(total: 65, status: 'Ordered')
      @order_6 = @admin.orders.create!(total: 65, status: 'Cancelled')
    end
    it 'should show all orders' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path

      expect(page).to have_content('All Orders')
      expect(page).to have_content("Order Number #{@order_1.id}")
    end
    it "should show the total number of orders per status" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path

      expect(page).to have_content('Orders by Status')
      expect(page).to have_content("Ordered: 2")
      expect(page).to have_content("Paid: 1")
      expect(page).to have_content("Cancelled: 3")
      expect(page).to have_content("Completed: 0")
    end
  end
end
