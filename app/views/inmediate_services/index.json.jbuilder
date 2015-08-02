json.array!(@inmediate_services) do |inmediate_service|
  json.extract! inmediate_service, :id, :phase, :reserved_at, :confirmed_at, :cancelled_at, :scheduled_to, :requested_seats, :started_at, :ended_at, :price, :vehicle_id, :service_type_id, :payment_type_id, :customer_id, :driver_id, :from_address_id, :to_address_id, vehicle_type_id
  json.url inmediate_service_url(inmediate_service, format: :json)
end
