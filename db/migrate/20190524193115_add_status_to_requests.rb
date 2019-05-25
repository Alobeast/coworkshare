class AddStatusToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :status, :string, default: "unconfirmed"
  end
end
