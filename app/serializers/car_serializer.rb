class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description
  has_many :appointments
  has_many :pictures, as: :imageable
end
