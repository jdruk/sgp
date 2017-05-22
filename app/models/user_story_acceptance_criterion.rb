class UserStoryAcceptanceCriterion < ActiveRecord::Base
  belongs_to :user_story

  validates :description, presence: true
  #validates :status, presence: true
  validates :user_story_id, presence: true
end
