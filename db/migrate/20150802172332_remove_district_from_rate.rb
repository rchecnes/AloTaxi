class RemoveDistrictFromRate < ActiveRecord::Migration
  def change
    remove_column :rates, :district_id
  end
end
