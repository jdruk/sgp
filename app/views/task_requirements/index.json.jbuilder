json.array!(@task_requirements) do |task_requirement|
  json.extract! task_requirement, :id, :level, :task_id, :ability_id
  json.url task_requirement_url(task_requirement, format: :json)
end
