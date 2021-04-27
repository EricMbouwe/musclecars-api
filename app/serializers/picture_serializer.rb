class PictureSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :car
end
