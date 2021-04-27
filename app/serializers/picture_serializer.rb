class PictureSerializer < ActiveModel::Serializer
  attributes :id, :url
  belongs_to :imageable
  belongs_to :car
end
