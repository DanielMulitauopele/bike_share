require 'rails_helper'

describe 'Visit the Admin Bike Shop Path' do
  context 'as an admin' do
    before(:each) do
      @accessory1 = create(:accessory)
      @accessory2 = create(:accessory, title: 'Thing2')
      @accessory3 = create(:accessory, title: 'Thing3')
      @accessory4 = create(:accessory, title: 'Thing4')
    end
    it 'should link from admin_dashboard' do
      admin = create(:user, role: 1)

     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit admin_dashboard_path

     click_link 'All Accessories'

     expect(current_path).to eq(admin_bike_shop_path)
      expect(page).to have_content(@accessory1.title)
      expect(page).to have_content(@accessory2.title)
      expect(page).to have_content(@accessory3.title)
      expect(page).to have_content(@accessory4.title)

    end
  end
end
