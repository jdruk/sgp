json.array!(@user_abilities) do |user_ability|
  json.extract! user_ability, :id, :points, :user_id, :ability_id
  json.url user_ability_url(user_ability, format: :json)
end
