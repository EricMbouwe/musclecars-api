class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description
  has_many :appointments
end
