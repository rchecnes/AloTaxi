class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :name
      t.double :price
      t.references :district, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
