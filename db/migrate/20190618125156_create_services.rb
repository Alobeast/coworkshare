class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :type
      t.integer :quantity_day
      t.integer :price_unit_day

      t.timestamps
    end
  end
end
