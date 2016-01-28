json.array!(@releases) do |release|
  json.extract! release, :id, :version, :deliver_date, :project_id
  json.url release_url(release, format: :json)
end
