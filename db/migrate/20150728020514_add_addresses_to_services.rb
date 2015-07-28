class AddAddressesToServices < ActiveRecord::Migration
  def change
    add_reference :services, :from_address, index: true
    add_reference :services, :to_address, index: true
  end
end
