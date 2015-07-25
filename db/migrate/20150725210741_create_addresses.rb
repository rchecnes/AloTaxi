class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :description
      t.boolean :state
      t.text :reference
      t.references :district, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
