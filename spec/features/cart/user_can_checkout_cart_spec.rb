require 'rails_helper'

describe 'User Checkout' do
  describe 'an order is submitted and the user will be redirect to their dashboard' do
    describe 'they link from the carts page' do
      it 'should create a new order when user presses checkout' do
        accessory_1 = create(:accessory)
        accessory_2 = create(:accessory, title: 'an accessory')
        accessory_3 = create(:accessory, title: 'an accessory again')
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit bike_shop_path

        within("#accessory-#{accessory_1.id}") do
          click_on 'Add to Cart'
        end
        within("#accessory-#{accessory_2.id}") do
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
        expect(page).to have_link("Order Number: 1")
        expect(page).to have_content("You have successfully submitted your order totaling $#{90}")
      end
    end
  end
  
  describe 'user can not checkout if cart is empty' do 
    it 'should not create an order' do 
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit carts_path 
      click_on 'Checkout' 
      
      expect(current_path).to eq(carts_path)
      expect(page).to have_content('Your cart is empty, please add items from the bike shop to your cart first before checking out!')
    end
  end 
end

describe 'when visitor clicks on checkout they are redirected to the login page' do
  it 'should redirect visitor to login page' do 
    accessory_1 = create(:accessory)
    accessory_2 = create(:accessory, title: 'an accessory')
    accessory_3 = create(:accessory, title: 'an accessory again')

    visit bike_shop_path

    within("#accessory-#{accessory_1.id}") do
      click_on 'Add to Cart'
    end
    within("#accessory-#{accessory_2.id}") do
      click_on 'Add to Cart'
    end
    within("#accessory-#{accessory_3.id}") do
      click_on 'Add to Cart'
    end
    within('#Cart-Header') do
      click_on 'Cart'
    end

    click_on 'Checkout' 

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Please login before checking out!')
  end
end




