class Sprint < ActiveRecord::Base
  belongs_to :project
  belongs_to :release
  
  has_many :user_stories
  has_many :tasks, through: :user_stories

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :planning_start_date, presence: true
  validates :planning_end_date, presence: true
  validates :execution_start_date, presence: true
  validates :execution_end_date, presence: true
  validates :review_meeting_date, presence: true
  validates :project_id, presence: true

  before_save do |project|
    project.start_date = project.start_date.beginning_of_day
    project.end_date = project.end_date.end_of_day
  end

  def progress
    count = self.tasks.count
    done = self.tasks.where(status: 4).count

    if count > 0
      return done * 100 / count
    else
      return 0
    end
  end
end


