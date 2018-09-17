require 'rails_helper'

describe 'Admin visits new condition page' do
  it 'should create' do
    temp = 1000

    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit  new_admin_condition_path


    fill_in 'condition[date]', with: '2018-01-01'
    fill_in 'condition[max_temperature]', with: temp
    fill_in 'condition[min_temperature]', with: temp
    fill_in 'condition[mean_temperature]', with: temp
    fill_in 'condition[mean_humidity]', with: temp
    fill_in 'condition[mean_visibility]', with: temp
    fill_in 'condition[mean_wind_speed]', with: temp
    fill_in 'condition[precipitation]', with: temp
    click_on 'Submit'

    expect(page).to have_content("Max Temperature: #{temp}")
    expect(page).to have_content("Mean Temperature: #{temp}")
    expect(page).to have_content("Min Temperature: #{temp}")
    expect(page).to have_content("Mean Humidity: #{temp}")
    expect(page).to have_content("Mean Visibility: #{temp}")
    expect(page).to have_content("Mean Wind Speed: #{temp}")
    expect(page).to have_content("Precipitation: #{temp}")
  end

  it 'should fail to create' do
    temp = 1000

    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit  new_admin_condition_path

    fill_in 'condition[max_temperature]', with: temp
    fill_in 'condition[min_temperature]', with: temp
    fill_in 'condition[mean_temperature]', with: temp
    fill_in 'condition[mean_humidity]', with: temp
    fill_in 'condition[mean_visibility]', with: temp
    fill_in 'condition[mean_wind_speed]', with: temp
    fill_in 'condition[precipitation]', with: temp
    click_on 'Submit'

    expect(page).to have_content("Failed to create!")
  end
  it "should link to new condition page from index page" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit conditions_path

    expect(page).to have_link('Create New Condition')
    click_on 'Create New Condition'

    expect(current_path).to eq(new_admin_condition_path)
  end
end
