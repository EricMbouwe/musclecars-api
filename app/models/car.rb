class Car < ApplicationRecord
  has_many :pictures, as: :imageable
  has_many :appointments
  has_many :users, through: :appointments

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price
end