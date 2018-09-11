class Station < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :dock_count, :city, :installation_date
  validates_uniqueness_of :name
  validates_uniqueness_of :slug

  has_many :trips
end
