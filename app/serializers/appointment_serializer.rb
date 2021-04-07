class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :city, :appointment_date, :car_id, :user_id
end
