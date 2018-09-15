require 'rails_helper'

describe 'user can edit their dashboard info' do
  before(:each) do
    @user1 = User.create!(name: 'Bob Ross', email: 'painterbob12@gmail.com', password: 'password')
    @user2 = User.create!(name: 'Bobby Ross', email: 'painterbob14@gmail.com', password: 'password')

    visit root_path
    click_on 'Login'
    fill_in :login_email, with: @user1.email
    fill_in :login_password, with: 'password'
    click_on 'Login'

    expect(page).to have_content('Bob Ross')
    expect(page).to have_content('painterbob12@gmail.com')

    click_link 'Edit Profile Information'
  end

  scenario 'user clicks on edit profile info' do
    fill_in "user[name]", with: "Robert Ross"
    fill_in "user[email]", with: "painterbob13@gmail.com"
    fill_in "user[password]", with: "1234"

    click_button 'Update User'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Robert Ross profile updated.")
    expect(page).to have_content('Robert Ross')
    expect(page).to have_content('painterbob13@gmail.com')
    expect(page).to_not have_content('1234')
  end

  scenario 'user cannot change email to one that is already taken' do
    fill_in "user[name]", with: "Robert Ross"
    fill_in "user[email]", with: "painterbob14@gmail.com"
    fill_in "user[password]", with: "1234"

    click_button 'Update User'

    expect(page).to have_content("User 'painterbob14@gmail.com' already exists.")
    expect(page).to_not have_content('Robert Ross')
    expect(page).to_not have_content('painterbob13@gmail.com')
  end

  scenario "user cannot edit another user's information" do
    visit "/users/2/edit"
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
