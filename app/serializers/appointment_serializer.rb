class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :city, :appointment_date, :car_id, :user_id
  belongs_to :car
  belongs_to :user
end
