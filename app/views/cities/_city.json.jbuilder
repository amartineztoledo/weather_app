json.extract! city, :id, :name,:opm_id, :created_at, :updated_at, :weathers
json.url city_url(city, format: :json)
