require 'rails_helper'

RSpec.describe 'When a user adds an accessory to their cart' do
  it 'a message is displayed' do
    accessory = create(:accessory)

    visit bike_shop_path

    click_button 'Add to Cart'

    expect(page).to have_content("You now have 1 copy of #{accessory.title} in your cart.")
  end

  it 'the message correctly increments for multiple songs' do
    accessory = create(:accessory)

    visit bike_shop_path

    click_button 'Add to Cart'

    expect(page).to have_content("You now have 1 copy of #{accessory.title} in your cart.")

    click_button 'Add to Cart'

    expect(page).to have_content("You now have 2 copies of #{accessory.title} in your cart.")
  end
  it 'the total number of songs in the cart increments' do
    create(:accessory)

    visit bike_shop_path

    expect(page).to have_content("Cart: 0")

    click_button 'Add to Cart'

    expect(page).to have_content("Cart: 1")

  end
end
