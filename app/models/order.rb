class Order < ApplicationRecord
  validates_presence_of :total, :status, :datetime
  belongs_to :user
end
