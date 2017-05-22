class Task < ActiveRecord::Base
	enum status: [:development, :pendent,:completed]

	belongs_to :user_story
	has_and_belongs_to_many :users
  has_many :task_requirements
	has_many :abilities, through: :task_requirements

	validates :description, presence: true
	validates :end_date, presence: true
	validates :start_date, presence: true
	validates :status, presence: true
	validates :user_story_id, presence: true

end
