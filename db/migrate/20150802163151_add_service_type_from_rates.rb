class AddServiceTypeFromRates < ActiveRecord::Migration
  def change
    add_reference :rates, :service_type, index: true
  end
end
