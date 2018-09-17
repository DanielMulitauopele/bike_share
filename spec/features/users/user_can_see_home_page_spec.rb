require 'rails_helper'

describe 'as a user' do
  describe 'visiting a home page' do
    it "should show home page in navbar" do
      visit stations_path

      expect(page).to have_link('Home')
      click_on 'Home'
      expect(current_path).to eq(root_path)
    end
  end
end
