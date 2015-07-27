json.array!(@services) do |service|
  json.extract! service, :id, :phase, :reserved_at, :confirmed_at, :cancelled_at, :scheduled_to, :requested_seats, :started_at, :ended_at, :price, :vehicle_id, :service_type_id, :payment_type_id, :person_id, :person_id, :address_id, :address_id
  json.url service_url(service, format: :json)
end
