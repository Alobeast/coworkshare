class Request < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :about, presence: true, length: { minimum: 100 }

  after_create :send_confirmation_email

  scope :unconfirmed, -> { where(status: 'unconfirmed') }
  scope :confirmed, -> { where(status: 'confirmed') }
  scope :accepted, -> { where(status: 'accepted') }
  scope :expired, -> { where(status: 'expired') }

  def accept!
    unless status != "confirmed"
      update(status: "accepted")
    end
  end

  private

  def send_confirmation_email
    RequestMailer.confirmation(self).deliver_later
  end
end
