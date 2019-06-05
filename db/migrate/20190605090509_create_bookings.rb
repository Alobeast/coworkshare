class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :room_bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :room, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
