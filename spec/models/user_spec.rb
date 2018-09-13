require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end
  
  describe 'relationships' do
    it {should have_many :orders}
  end
  
  describe 'roles' do
    it 'can be created as an admin' do
      user = User.create(name: 'Rajaa', password: '1234', role: 1)

      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end

    it 'can be created as a default user' do
      user = User.create(name: 'Tara', password: '5678', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end
  end
end
