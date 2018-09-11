require 'rails_helper'

describe 'as a visitor' do
  describe 'can update items in the cart' do
    it "should be able to increase quantity" do
      accessory = create(:accessory)
      visit bike_shop_path

      click_button 'Add to Cart'
      expect(page).to have_content("You now have 1 of  #{accessory.title} in your cart.")

      within '#Cart-Header' do
        click_on 'Cart'
      end

      expect(page).to have_content(accessory.title)
      expect(page).to have_content(1)

      click_on '+'
      expect(page).to have_content(2)
    end
    it "should be able to increase quantity" do
      accessory = create(:accessory)
      visit bike_shop_path

      click_button 'Add to Cart'
      click_button 'Add to Cart'
      expect(page).to have_content("You now have 2 of  #{accessory.title} in your cart.")

      within '#Cart-Header' do
        click_on 'Cart'
      end

      expect(page).to have_content(accessory.title)
      expect(page).to have_content(2)

      click_on '1'
      expect(page).to have_content(1)
    end
  end
end
