json.array!(@function_user_projects) do |function_user_project|
  json.extract! function_user_project, :id, :function_id, :user_id, :project_id
  json.url function_user_project_url(function_user_project, format: :json)
end
