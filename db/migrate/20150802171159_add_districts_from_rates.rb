class AddDistrictsFromRates < ActiveRecord::Migration
  def change
    add_reference :rates, :from_district, index: true
    add_reference :rates, :to_district, index: true
  end
end
