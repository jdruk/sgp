json.array!(@user_stories) do |user_story|
  json.extract! user_story, :id, :description, :business_value, :story_points, :status, :theme_id, :sprint_id
  json.url user_story_url(user_story, format: :json)
end
