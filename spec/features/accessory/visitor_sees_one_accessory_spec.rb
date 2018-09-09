require 'rails_helper'

describe 'visitor sees one accessory' do
  describe 'they link from accessory index' do
    before(:each) do
      @accessory = create(:accessory)
    end

    it "displays one accessory" do
      #the path will need to change to the accessories index
      #but I don't want to change anything right now since
      #the cart branch has not been merged

      # visit bike_shop_path
      visit accessory_path(@accessory)
save_and_open_page
      expect(page).to have_content(@accessory.title)
      expect(page).to have_css("img[src*='default-image']", visible: false)
      expect(page).to have_content(@accessory.description)
      expect(page).to have_content(@accessory.price)
      expect(page).to have_button('Add to Cart')
    end
  end
end
