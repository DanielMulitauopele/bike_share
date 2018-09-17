require 'rails_helper'

describe 'as an admin ' do
  describe 'visiting condition show page' do
    before(:each) do
      @condition = create(:condition, id: 1)
      @admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    
    it 'Admin can link to edit page to edit condition' do
      temp = 1000
      new_date = '2018-12-14'

      visit condition_path(@condition)

      click_on 'Edit'

      expect(current_path).to eq(edit_admin_condition_path(@condition))
      fill_in 'condition[date]', with: new_date
      fill_in 'condition[max_temperature]', with: temp
      fill_in 'condition[min_temperature]', with: temp
      fill_in 'condition[mean_temperature]', with: temp
      fill_in 'condition[mean_humidity]', with: temp
      fill_in 'condition[mean_visibility]', with: temp
      fill_in 'condition[mean_wind_speed]', with: temp
      fill_in 'condition[precipitation]', with: temp
      click_on 'Submit'
      
      expect(current_path).to eq(condition_path(@condition))
      expect(page).to have_content("#{new_date} updated successfully!")
    end
  
    it 'Admin can not edit condition if invalid entry' do
      temp = 1000
    
      visit edit_admin_condition_path(@condition)

      fill_in 'condition[date]', with: ''
      fill_in 'condition[max_temperature]', with: temp
      fill_in 'condition[min_temperature]', with: temp
      fill_in 'condition[mean_temperature]', with: temp
      fill_in 'condition[mean_humidity]', with: temp
      fill_in 'condition[mean_visibility]', with: temp
      fill_in 'condition[mean_wind_speed]', with: temp
      fill_in 'condition[precipitation]', with: temp
      click_on 'Submit'
      
      expect(current_path).to eq(admin_condition_path(@condition))
      expect(page).to have_content('Failed to update!')
    end
  end
end
