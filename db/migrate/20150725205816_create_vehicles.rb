class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.text :description
      t.integer :seats_capacity
      t.string :plate
      t.string :year
      t.string :brand
      t.string :soat
      t.references :vehicle_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
