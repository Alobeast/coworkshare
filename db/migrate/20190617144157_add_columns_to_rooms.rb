class AddColumnsToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :size, :integer
    add_column :rooms, :price, :integer
  end
end
