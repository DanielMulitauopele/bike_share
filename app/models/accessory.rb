class Accessory < ApplicationRecord
  validates_presence_of :description, :price
  validates :title, uniqueness: true, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0
  has_many :order_accessories
  has_many :orders, through: :order_accessories
  enum status: [ :active, :retired]


end
