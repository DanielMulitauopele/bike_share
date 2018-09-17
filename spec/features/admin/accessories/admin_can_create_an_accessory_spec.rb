require 'rails_helper'

describe 'Visit Admin Bike Shop New' do
  describe 'they link from the bike shop page' do
    context 'as an admin' do
      it 'should allow the admin to create an accessory' do
        admin = create(:user, role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        
        visit bike_shop_path
        click_on 'Create A New Accessory'
        
        expect(current_path).to eq(admin_bike_shop_new_path)
        expect(page).to have_content('Create New Accessory')

        fill_in 'accessory[title]', with: 'New Thing'
        fill_in 'accessory[description]', with: 'Thingy thing'
        fill_in 'accessory[price]', with: 100
        click_on 'Create Accessory'

        expect(page).to have_content('New Thing')
        expect(page).to have_content('Thingy thing')
      end
    end
  end 
end
