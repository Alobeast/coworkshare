class AddReconfirmedToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :reconfirmed, :boolean, default: false
  end
end
