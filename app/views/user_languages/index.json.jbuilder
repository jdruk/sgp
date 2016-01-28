json.array!(@user_languages) do |user_language|
  json.extract! user_language, :id, :proficiency, :user_id, :language_id
  json.url user_language_url(user_language, format: :json)
end
