class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :password, require: true
  validates :email, presence: true, uniqueness: true

  has_secure_password
  has_many :orders
end 
