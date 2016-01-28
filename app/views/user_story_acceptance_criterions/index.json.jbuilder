json.array!(@user_story_acceptance_criterions) do |user_story_acceptance_criterion|
  json.extract! user_story_acceptance_criterion, :id, :description, :status, :user_story_id
  json.url user_story_acceptance_criterion_url(user_story_acceptance_criterion, format: :json)
end
