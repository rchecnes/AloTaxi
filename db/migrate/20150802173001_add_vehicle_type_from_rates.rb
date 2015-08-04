class AddVehicleTypeFromRates < ActiveRecord::Migration
  def change
    add_reference :rates, :vehicle_type, index: true, foreign_key: true
  end
end
