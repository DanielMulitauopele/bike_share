require 'rails_helper'

describe Accessory, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
    it {should validate_presence_of :price}

    it {should validate_uniqueness_of :title}
  end
  
  describe 'relationships' do
    it {should have_many :order_accessories}
    it {should have_many :orders}
  end
end
