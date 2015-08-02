json.array!(@rates) do |rate|
  json.extract! rate, :id, :name, :price, :from_district_id, :to_district_id
  json.url rate_url(rate, format: :json)
end
