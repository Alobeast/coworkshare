class CreateJoinTableRoomService < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rooms, :services do |t|
      t.index [:room_id, :service_id]
      # t.index [:service_id, :room_id]
    end
  end
end
