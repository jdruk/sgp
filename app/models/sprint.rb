class Sprint < ActiveRecord::Base
  belongs_to :project
  belongs_to :release
  has_many :user_stories

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :planning_start_date, presence: true
  validates :planning_end_date, presence: true
  validates :execution_start_date, presence: true
  validates :execution_end_date, presence: true
  validates :review_meeting_date, presence: true
  validates :project_id, presence: true

end


