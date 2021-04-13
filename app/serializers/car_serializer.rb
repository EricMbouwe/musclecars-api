class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :pictures
  has_many :appointments
  has_many :pictures, as: :imageable
end
