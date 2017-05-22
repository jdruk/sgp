class UserStory < ActiveRecord::Base
  #enum status: {pendent: 1, development: 2, test: 3, completed: 4}
  attr_accessor :theme_search

  belongs_to :theme
  belongs_to :sprint
  belongs_to :project
  has_many :user_story_acceptance_criterions
  has_many :tasks
  
  validates :description, presence: true

end
