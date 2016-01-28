class Task < ActiveRecord::Base
  belongs_to :user_story
  has_and_belongs_to_many :users
  has_many :task_requirements
end
