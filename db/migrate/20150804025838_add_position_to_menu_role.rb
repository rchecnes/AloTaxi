class AddPositionToMenuRole < ActiveRecord::Migration
  def change
    add_column :menu_roles, :position, :integer
  end
end
