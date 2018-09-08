require 'rails_helper'

RSpec.describe 'when a visitor adds an accessory to their cart' do
  it 'a message is displayed' do
    accessory = create(:accessory)
    visit bike_shop_path

    click_button 'Add to Cart'

    expect(page).to have_content("You have added an #{accessory.title} to your cart!")
  end
end
