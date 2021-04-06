class Car < ApplicationRecord
  has_many :pictures, as: :imageable
  has_many :appointments
  has_many :users, through: :appointments
end
