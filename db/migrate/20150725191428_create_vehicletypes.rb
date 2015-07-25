class CreateVehicletypes < ActiveRecord::Migration
  def change
    create_table :vehicletypes do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
