require 'rails_helper'

describe Order, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:total)}
    it {should validate_presence_of(:status)}
  end
  
  describe 'relationships' do
    it {should belong_to :user}
    it {should have_many :order_accessories}
    it {should have_many :accessories}
  end
end
