json.array!(@rates) do |rate|
  json.extract! rate, :id, :name, :price, :district_id, :district_id
  json.url rate_url(rate, format: :json)
end
