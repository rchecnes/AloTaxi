class AddVehicleTypeToServices < ActiveRecord::Migration
  def change
    add_reference :services, :vehicle_type, index: true, foreign_key: true, null: true
  end
end
