class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
