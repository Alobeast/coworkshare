class Request < ApplicationRecord

  belongs_to :user
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  # , format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/}
  ## optional regex
  validates :phone_number, presence: true, uniqueness: true, length: { minimum: 10 }
  # , format: { with: /\A((\+)33|0|0033)[1-9](\d{2}){4}\z/} ## optional regex
  validates :about, presence: true, length: { minimum: 100 }
  after_create :send_confirmation_email

  scope :unconfirmed, -> { where(status: 'unconfirmed') }
  scope :confirmed, -> { where(status: 'confirmed') }
  scope :accepted, -> { where(status: 'accepted') }
  scope :expired, -> { where(status: 'expired') }
  scope :status, -> (status) { where status: status }

  def accept!
    @waiting_list = Request.order('created_at').confirmed.to_a
    @position = @waiting_list.index { |confirmed| confirmed.id == self.id }
    if status == "confirmed" && @position == 0
      update(status: "accepted")
    else
      puts "error: only the first request from the confirmed waiting list can be
       accepted!"
    end
  end

  private

  def send_confirmation_email
    RequestMailer.confirmation(self).deliver_later
  end
end
