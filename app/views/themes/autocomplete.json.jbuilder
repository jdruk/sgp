json.themes do
  json.array!(@themes) do |theme|
    #json.search_sugesstion "title: #{theme.name}"
    json.extract! theme, :name, :description
  end
end