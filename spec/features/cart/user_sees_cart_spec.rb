require 'rails_helper'

describe 'user sees all items in cart' do
  it 'retains cart items on login' do
    accessory_1 = create(:accessory)
    accessory_2 = create(:accessory, title: 'an accessory')
    accessory_3 = create(:accessory, title: 'an accessory again')
    user = create(:user)

    visit bike_shop_path

    expect(page).to have_content("Cart: 0")

    within("#accessory-#{accessory_1.id}") do
      click_on 'Add to Cart'
    end
    within("#accessory-#{accessory_2.id}") do
      click_on 'Add to Cart'
    end
    within("#accessory-#{accessory_3.id}") do
      click_on 'Add to Cart'
    end

    visit login_path

    fill_in 'login_email', with: user.email
    fill_in 'login_password', with: '1234'
    click_button 'Login'

    within('#Cart-Header') do
      click_on 'Cart'
    end
    
    expect(current_path).to eq(carts_path)
    expect(page).to have_content(accessory_1.title)
    expect(page).to have_content("price: #{accessory_1.price}")
    expect(page).to have_content(accessory_2.title)
    expect(page).to have_content("price: #{accessory_2.price}")
    expect(page).to have_content(accessory_3.title)
    expect(page).to have_content("price: #{accessory_3.price}")
    expect(page).to have_content(90)
  end
end

# describe 'When user clicks on checkout they are directed to their dashboard page' do 
#   describe 'they link from the cart page' do 
#     it 'should direct user to their dashboard' do 
#       accessory_1 = create(:accessory)
#       accessory_2 = create(:accessory, title: 'an accessory')
#       user = create(:user)
# 
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
# 
#       visit carts_path
# 
#       expect(page).to have_content(accessory_1.title)
#       expect(page).to have_content("price: #{accessory_1.price}")
#       expect(page).to have_content(accessory_2.title)
#       expect(page).to have_content("price: #{accessory_2.price}")
#       expect(page).to have_content(90)
# 
#       click_on 'checkout'
# 
#       expect(current_path).to eq(dashboard_path)
#       expect(page).to have_content('You have have successfully submitted your order totaling $total')
#     end 
#   end 
# end