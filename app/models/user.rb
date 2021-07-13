class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :cars, through: :appointments

  validates_presence_of :name, :password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
