class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :cars, through: :appointment

  validates_presence_of :name, :password, :email
  validates_uniqueness_of :email
end
