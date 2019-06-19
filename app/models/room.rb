class Room < ApplicationRecord
  has_many :requests
  has_one_attached :picture
  has_and_belongs_to_many :services
end
