class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates_presence_of :date
  validates_presence_of :city
end
