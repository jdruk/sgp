class UserStory < ActiveRecord::Base
  # enum status: {pendent: 1, development: 2, test: 3, completed: 4}
  attr_accessor :theme_search

  belongs_to :theme
  belongs_to :sprint
  belongs_to :project
  
  has_many :user_story_acceptance_criterions
  has_many :tasks
  
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants

  validates :description, presence: true

  def roi
    return business_value / story_points
  rescue
    return 0
  end

  def status_label
    labels = {1 => 'Pendente', 2 => 'Desenvolvimento', 3 => 'Teste', 4 => 'Concluída', 5 => 'Depreciada'}
    return labels[self.status]
  end

  def theme_search
    unless self.theme_id.nil?
      self.theme_search = self.theme.name
    end
  end

  def progress
    return self.tasks.where(status: 4).count * 100 / self.tasks.count
  rescue
    return 0
  end
end
