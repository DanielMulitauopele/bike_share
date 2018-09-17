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

    click_on 'Cart'

    expect(current_path).to eq(carts_path)
    expect(page).to have_content(accessory_1.title)
    expect(page).to have_content("Price: #{accessory_1.price}")
    expect(page).to have_content(accessory_2.title)
    expect(page).to have_content("Price: #{accessory_2.price}")
    expect(page).to have_content(accessory_3.title)
    expect(page).to have_content("Price: #{accessory_3.price}")
    expect(page).to have_content("Total: $#{90}")
  end
end
