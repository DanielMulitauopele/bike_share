class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :password, require: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
  enum role: ['default', 'admin']
end 