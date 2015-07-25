class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.references :person, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
