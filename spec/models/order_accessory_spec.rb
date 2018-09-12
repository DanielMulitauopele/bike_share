require 'rails_helper'

describe OrderAccessory, type: :model do
  describe 'relationships' do
    it {should belong_to :order}
    it {should belong_to :accessory}
  end
end 
