module ApplicationHelper
  def is_active?(page_name)
    "active" if params[:action] == page_name
  end

  def is_current_page?(path)
    'active' if current_page?(path)
  end

  def status_labels
    return {'Pendente' => 1, 'Desenvolvimento' => 2, 'Teste' => 3, 'Concluída' => 4, 'Depreciada' => 5}
  end
end
