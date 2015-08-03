class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: true
    add_column :users, :last_name, :string, null: true
    add_column :users, :phone, :string, null: true
    add_column :users, :dni, :string, null: true
    add_column :users, :license, :string, null: true
    add_reference :users, :role, index: true, foreign_key: true, null: true
  end
end