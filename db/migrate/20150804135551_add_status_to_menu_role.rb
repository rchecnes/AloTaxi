class AddStatusToMenuRole < ActiveRecord::Migration
  def change
    add_column :menu_roles, :status, :boolean
  end
end
