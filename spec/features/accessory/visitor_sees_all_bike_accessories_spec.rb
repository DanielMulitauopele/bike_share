require 'rails_helper'

describe 'visitor sees all bike accessories' do
  describe 'they visit bike shop' do
    before(:each) do
      @accessory = create(:accessory)
    end

    it "displays all bike accessories" do
      visit 
    end
  end
end
