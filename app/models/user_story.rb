class UserStory < ActiveRecord::Base
  # enum status: {pendent: 1, development: 2, test: 3, completed: 4}
  attr_accessor :theme_search

  belongs_to :theme
  belongs_to :sprint
  belongs_to :project
  has_many :user_story_acceptance_criterions
  has_many :tasks
  
  validates :description, presence: true

  def roi
    return business_value / story_points
  rescue
    return 0
  end

  def status_label
    labels = {1 => :pendent, 2 => :development, 3 => :test, 4 => :completed}
    return labels[self.status]
  end

  def theme_search
    unless self.theme_id.nil?
      self.theme_search = self.theme.name
    end
  end

end
