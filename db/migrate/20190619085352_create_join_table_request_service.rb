class CreateJoinTableRequestService < ActiveRecord::Migration[5.2]
  def change
    create_join_table :requests, :services do |t|
      t.index [:request_id, :service_id]
      # t.index [:service_id, :request_id]
    end
  end
end
