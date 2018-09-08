require 'rails_helper'

describe 'visitor sees all bike accessories' do
  describe 'they visit bike shop' do
    before(:each) do
      @accessory1 = create(:accessory)
      @accessory2 = create(:accessory, title: 'Thing2')
      @accessory3 = create(:accessory, title: 'Thing3')
      @accessory4 = create(:accessory, title: 'Thing4')
    end

    it "displays all bike accessories" do
      visit '/bike-shop'

      expect(page).to have_content(@accessory1.title)
      expect(page).to have_content(@accessory2.title)
      expect(page).to have_content(@accessory3.title)
      expect(page).to have_content(@accessory4.title)
    end

    it "displays a cart button" do
      visit '/bike-shop'

      expect(page).to have_link('Add to Cart')
    end
  end
end
