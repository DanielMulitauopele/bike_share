require 'rails_helper'

RSpec.describe 'when a visitor adds an accessory to their cart' do
  it 'a message is displayed' do
    accessory = create(:accessory)
    visit bike_shop_path

    click_button 'Add to Cart'
    expect(page).to have_content("You have added #{accessory.title} to your cart!")

    click_button('Add to Cart')
    expect(page).to have_content("You have added #{accessory.title} to your cart!")
  end

  it "should increment items in cart" do
    accessory = create(:accessory)

    visit bike_shop_path

    expect(page).to have_content("Cart: 0")

    click_button('Add to Cart')

    expect(page).to have_content("Cart: 1")
  end
end
