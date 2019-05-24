class AddColumnsToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :first_name, :string
    add_column :requests, :last_name, :string
    add_column :requests, :email, :string
    add_column :requests, :phone_number, :string
    add_column :requests, :about, :string
  end
end
