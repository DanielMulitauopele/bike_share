require 'rails_helper' 

describe 'user can visit login page' do 
  describe 'they link from the root page' do
    it 'should allow user to vist login page' do 
      visit root_path 
      click_link 'Login'
      
      expect(current_path).to eq(login_path)
      expect(page).to have_content('Create Account')
    end 
  end
  
  describe 'user can create an account' do
    describe 'they link from login page' do 
      it 'should register the new user' do
        username = 'Hans'
        email = 'hans@email.com'
        
        visit login_path
        click_link 'Create Account'
        
        expect(current_path).to eq(new_user_path)
        
        fill_in :user_name, with: username
        fill_in :user_email, with: email 
        fill_in :user_password, with: 'test123'
        click_on 'Create User'
        
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Logged in as #{User.last.name}")
        expect(page).to have_content("#{User.last.email}")
        expect(page).to have_content("My Orders")
        expect(page).to have_content('Log Out')
        expect(page).to_not have_content('Log In')
        
      end  
    end
  end
  
  it 'should not register a new user if invalid entry' do 
    User.create!(name: 'Hans', email: 'hans@email.com', password: 'test123')
    username = 'Hilde'
    email = 'hans@email.com'
    
    visit new_user_path
    
    fill_in :user_name, with: username
    fill_in :user_email, with: email 
    fill_in :user_password, with: 'test123'
    click_on 'Create User'
    
    expect(current_path).to eq(users_path)
    expect(page).to have_content('Oops, could not create account. Please use a valid email and password and try again.')
  end 
end 