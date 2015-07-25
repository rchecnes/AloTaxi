json.array!(@services) do |service|
  json.extract! service, :id, :phase, :reserved_at, :confirmed_at_datetime, :cancelled_at, :scheduled_to, :requested_to, :started_at, :ended_at, :price_double, :person_id, :person_id, :payment_type_id, :vehicle_id, :service_type_id, :address_id, :address_id
  json.url service_url(service, format: :json)
end
