module ProjectsHelper
  def current_project
    Project.where(id: session[:project]).first
  end

  def current_project_id
    session[:project]
  end

  def has_project_selected?
    session[:project]
  end
end
