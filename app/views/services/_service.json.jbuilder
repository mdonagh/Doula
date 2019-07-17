json.extract! service, :id, :name, :description, :price, :intervals, :created_at, :updated_at
json.url service_url(service, format: :json)
