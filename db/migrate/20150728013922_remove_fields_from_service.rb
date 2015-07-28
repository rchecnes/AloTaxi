class RemoveFieldsFromService < ActiveRecord::Migration
  def change
    remove_column :services, :customer_id
    remove_column :services, :driver_id
    remove_column :services, :to_address_id
    remove_column :services, :from_address_id
  end
end
 