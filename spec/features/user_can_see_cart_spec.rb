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
end
