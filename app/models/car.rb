class Car < ApplicationRecord
  has_many :pictures, as: :imageable, dependent: :delete_all
  has_many :appointments
  has_many :users, through: :appointments

  validates_presence_of :name, :description, :price
end
