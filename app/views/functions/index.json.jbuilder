json.array!(@functions) do |function|
  json.extract! function, :id, :name, :description
  json.url function_url(function, format: :json)
end
