class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  validates_presence_of :url
end
