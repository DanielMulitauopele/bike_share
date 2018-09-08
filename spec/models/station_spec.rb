require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:dock_count) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:installation_date) }

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:slug) }
  end
end
