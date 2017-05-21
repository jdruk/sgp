module ApplicationHelper
  def is_active?(page_name)
    "active" if params[:action] == page_name
  end

  def is_current_page?(path)
    'active' if current_page?(path)
  end
end
