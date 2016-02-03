class UserStory < ActiveRecord::Base
  enum status: [:pendent,:development,:completed,:test]

  belongs_to :theme
  belongs_to :sprint
  has_many :user_story_acceptance_criterions
  has_many :tasks
  
  validates :description, presence: true
  validates :business_value, presence: true
  validates :story_points, presence: true
  validates :status, presence: true
  validates :theme_id, presence: true

end
