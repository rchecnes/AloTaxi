class CreateMenuRoles < ActiveRecord::Migration
  def change
    create_table :menu_roles do |t|
      t.string :name
      t.string :icon
      t.string :link
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
