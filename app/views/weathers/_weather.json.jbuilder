json.extract! weather, :id, :temp, :city_id, :created_at, :updated_at
json.url weather_url(weather, format: :json)
