json.array!(@menu_roles) do |menu_role|
  json.extract! menu_role, :id, :name, :icon, :link, :role_id, :position
  json.url menu_role_url(menu_role, format: :json)
end
