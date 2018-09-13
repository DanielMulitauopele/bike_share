class Accessory < ApplicationRecord
  validates_presence_of :description, :price
  validates :title, uniqueness: true, presence: true
  has_many :order_accessories
  has_many :orders, through: :order_accessories
  enum status: [ :active, :retired]


end
