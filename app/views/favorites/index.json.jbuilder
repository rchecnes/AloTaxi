json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :name, :user_id, :address_id
  json.url favorite_url(favorite, format: :json)
end
