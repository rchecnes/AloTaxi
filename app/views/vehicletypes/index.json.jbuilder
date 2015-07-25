json.array!(@vehicletypes) do |vehicletype|
  json.extract! vehicletype, :id, :name, :description
  json.url vehicletype_url(vehicletype, format: :json)
end
