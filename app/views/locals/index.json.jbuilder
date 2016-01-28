json.array!(@locals) do |local|
  json.extract! local, :id, :name, :country, :state, :city, :zip_code
  json.url local_url(local, format: :json)
end
