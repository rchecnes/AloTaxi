class AddAddressesFromRates < ActiveRecord::Migration
  def change
    add_reference :rates, :from_address, index: true
    add_reference :rates, :to_address, index: true
  end
end
