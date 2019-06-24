class CreateRequestServices < ActiveRecord::Migration[5.2]
  def change
    create_table :request_services do |t|
      t.references :request, foreign_key: true
      t.references :service, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
