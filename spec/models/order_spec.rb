require 'rails_helper'

describe Order, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:total)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:datetime)}
  end
  describe 'relationships' do
    it {should belong_to :user}
  end
end 
