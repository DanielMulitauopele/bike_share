require 'rails_helper' 

describe 'user can visit login page' do 
  describe 'they link from the root page' do
    it 'should allow user to vist login page' do 
      visit root_path 
      click_link 'Login'
      
      expect(current_path).to eq(login_path)
      expect(page).to have_content('Please log in or sign up if you are not a registered user, yet!')
      save_and_open_page
    end 
  end
end 