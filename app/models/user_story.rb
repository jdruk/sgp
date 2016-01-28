class UserStory < ActiveRecord::Base
  belongs_to :theme
  belongs_to :sprint
  has_many :user_story_acceptance_criterions
  has_many :tasks
  

end
