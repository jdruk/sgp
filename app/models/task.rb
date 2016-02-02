class Task < ActiveRecord::Base
	enum status: [:development, :pendent,:completed]

	belongs_to :user_story
	has_and_belongs_to_many :users
	has_many :task_requirements
end
