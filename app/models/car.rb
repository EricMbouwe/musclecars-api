class Car < ApplicationRecord
  has_many :pictures, as: :imageable
end
