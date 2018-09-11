require 'rails_helper'

describe 'Visitor sees all items in the cart' do
  it 'shows all items in cart' do
    accessory_1 = create(:accessory)
    accessory_2 = create(:accessory, title: 'an accessory')
    accessory_3 = create(:accessory, title: 'an accessory again')

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

    within('#Cart-Header') do
      click_on 'Cart'
    end


     expect(page).to have_content(accessory_1.title)
     expect(page).to have_content("price: #{accessory_1.price}")
     expect(page).to have_content(accessory_2.title)
     expect(page).to have_content("price: #{accessory_2.price}")
    expect(page).to have_content(accessory_3.title)
    expect(page).to have_content("price: #{accessory_3.price}")
    expect(page).to have_content(90)

    expect(current_path).to eq(carts_path)
  end
  
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

     expect(page).to have_content(accessory_1.title)
     expect(page).to have_content("price: #{accessory_1.price}")
     expect(page).to have_content(accessory_2.title)
     expect(page).to have_content("price: #{accessory_2.price}")
    expect(page).to have_content(accessory_3.title)
    expect(page).to have_content("price: #{accessory_3.price}")
    expect(page).to have_content(90)

    expect(current_path).to eq(carts_path)
  end
  
  it 'can remove items from the cart' do
    accessory_1 = create(:accessory)

    visit bike_shop_path

    expect(page).to have_content("Cart: 0")

    within("#accessory-#{accessory_1.id}") do
      click_on 'Add to Cart'
    end

    within('#Cart-Header') do
      click_on 'Cart'
    end

    click_on 'Remove'

    expect(current_path).to eq(carts_path)
    expect(page).to have_content("Successfully removed #{accessory_1.title} from your cart.")
    expect(page).to_not have_css("#accessory-1#{accessory_1.id}")
  end
  it 'links to the deleted accessory' do
    accessory_1 = create(:accessory)

    visit bike_shop_path

    expect(page).to have_content("Cart: 0")

    within("#accessory-#{accessory_1.id}") do
      click_on 'Add to Cart'
    end

    within('#Cart-Header') do
      click_on 'Cart'
    end

    click_on 'Remove'

    click_on accessory_1.title

    expect(page).to have_content(accessory_1.title)
    expect(current_path).to eq(accessory_path(accessory_1))
  end
end
