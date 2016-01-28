json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :start_date, :end_date, :planning_start_date, :planning_end_date, :execution_start_date, :execution_end_date, :review_meeting_date, :retrospective_meeting_date, :project_id, :release_id
  json.url sprint_url(sprint, format: :json)
end
