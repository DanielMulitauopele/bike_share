require 'rails_helper'

RSpec.describe Cart do
  subject { Cart.new({1 => 2, 2 => 3}) }

  describe '#total_count' do
    it 'can calculate the total number if items it holds' do
      expect(subject.total_count).to eq(5)
    end
  end

  describe '#add_accessory' do
    it 'calculates the total number of accessories it holds' do
      subject.add_accessory(1)
      subject.add_accessory(2)

      expect(subject.contents).to eq({1 => 3, 2 => 4})
    end
  end
end
