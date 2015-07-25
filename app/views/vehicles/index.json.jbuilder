json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :name, :description, :seats_capacity, :plate, :year, :brand, :soat, :vehicle_type_id
  json.url vehicle_url(vehicle, format: :json)
end
