class Service < ApplicationRecord
  has_and_belongs_to_many :rooms
  # has_and_belongs_to_many :requests
  has_many :request_services
  has_many :requests, through: :request_services
end
