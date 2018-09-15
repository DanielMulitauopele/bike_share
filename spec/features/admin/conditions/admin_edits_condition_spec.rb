require 'rails_helper'

describe 'as an admin ' do
  describe 'visiting condition show page' do
    before(:each) do
      @condition = create(:condition, id: 1)
    end
    
    it 'should link to the edit page' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit condition_path(@condition)

      click_on 'Edit'

      expect(current_path).to eq(edit_admin_condition_path(@condition))
    end
  end
end
