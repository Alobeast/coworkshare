class Request < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :about, presence: true, length: { minimum: 100 }
end
