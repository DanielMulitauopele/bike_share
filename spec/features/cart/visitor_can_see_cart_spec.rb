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
    
    expect(current_path).to eq(carts_path)
    expect(page).to have_content(accessory_1.title)
    expect(page).to have_content("Price: #{accessory_1.price}")
    expect(page).to have_content(accessory_2.title)
    expect(page).to have_content("Price: #{accessory_2.price}")
    expect(page).to have_content(accessory_3.title)
    expect(page).to have_content("Price: #{accessory_3.price}")
    expect(page).to have_content("Total: $#{90}")
  end
  
  it 'can remove items from the cart' do
    accessory = create(:accessory)

    visit bike_shop_path

    expect(page).to have_content("Cart: 0")

    within("#accessory-#{accessory.id}") do
      click_on 'Add to Cart'
    end
    
    within('#Cart-Header') do
      click_on 'Cart'
    end

    click_on 'Remove'

    expect(current_path).to eq(carts_path)
    expect(page).to have_content("Successfully removed #{accessory.title} from your cart.")
    expect(page).to_not have_css("#accessory-1#{accessory.id}")
  end
  
  it 'links to the deleted accessory' do
    accessory = create(:accessory)

    visit bike_shop_path

    expect(page).to have_content("Cart: 0")

    within("#accessory-#{accessory.id}") do
      click_on 'Add to Cart'
    end

    within('#Cart-Header') do
      click_on 'Cart'
    end

    click_on 'Remove'

    click_on accessory.title
    
    expect(current_path).to eq(accessory_path(accessory))
    expect(page).to have_content(accessory.title)
  end
end

      
