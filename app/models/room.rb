class Room < ApplicationRecord
  has_many :requests
  has_one_attached :picture
end
