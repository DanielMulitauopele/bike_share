require 'rails_helper'

RSpec.describe 'when a visitor adds an accessory to their cart' do
  it 'items in carts are incremented and corresponding messages are dispalyed' do
    accessory = create(:accessory)
    
    visit bike_shop_path
    expect(page).to have_content("Cart: 0")
    
    click_button 'Add to Cart'
    
    expect(page).to have_content("Cart: 1")
    expect(page).to have_content("You now have 1 of  #{accessory.title} in your cart.")

    click_button('Add to Cart')
    
    expect(page).to have_content("Cart: 2")
    expect(page).to have_content("You now have 2 of #{accessory.title} in your cart.")
  end
end
