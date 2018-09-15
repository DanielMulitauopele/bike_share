class Order < ApplicationRecord
  validates_presence_of :total, :status
  belongs_to :user
  has_many :order_accessories
  has_many :accessories, through: :order_accessories

  def format
    grouped = accessories.group(:accessory_id).count
    formatted_hash = {}
    grouped.each do |item_id, count|
      item = Accessory.find(item_id.to_i)
      formatted_hash[item] = {'count' => count, 'subtotal' => (item.price * count)}
    end
    formatted_hash
  end

  def self.orders_by_status_count
    require "pry"; binding.pry
    self.group(:status).count
  end
end
