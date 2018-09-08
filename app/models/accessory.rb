class Accessory < ApplicationRecord
  validates_presence_of :description, :price
  validates :title, uniqueness: true, presence: true
end
