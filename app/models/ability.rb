class Ability < ActiveRecord::Base
	has_many :task_requirements
	has_many :tasks, through: :task_requirements
	has_many :user_abilities
	has_many :users, through: :user_abilities
end
