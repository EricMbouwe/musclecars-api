class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates_presence_of :appointment_date
  validates_presence_of :city
end
