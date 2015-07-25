class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :phase
      t.datetime :reserved_at
      t.string :confirmed_at_datetime
      t.datetime :cancelled_at
      t.datetime :scheduled_to
      t.datetime :requested_to
      t.datetime :started_at
      t.datetime :ended_at
      t.string :price_double
      t.references :person, index: true, foreign_key: true
      t.references :person, index: true, foreign_key: true
      t.references :payment_type, index: true, foreign_key: true
      t.references :vehicle, index: true, foreign_key: true
      t.references :service_type, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
