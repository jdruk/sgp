class Project < ActiveRecord::Base
  belongs_to :local
  has_many :themes
  has_many :sprints
  has_many :releases
  has_many :function_user_projects
  has_many :functions, through: :function_user_projects
  has_many :users, through: :function_user_projects

  has_many :user_stories
  has_many :tasks, through: :user_stories

  validates :name, presence: true

  before_save do |project|
    project.start_date = project.start_date.beginning_of_day
    project.end_date = project.end_date.end_of_day
  end

  def members_number
    self.users.count
  end

  def current_sprint
    current = nil
    today = Time.now

    self.sprints.each do |sprint|
      if today.between?(sprint.start_date, sprint.end_date)
        current = sprint
      end
    end

    if current.nil?
      return nil
    else
      return current.name
    end
  end

  def size
    self.user_stories.sum(:story_points)
  end

  def progress
    # progress per user story
    # count = self.user_stories.count
    # done = self.user_stories.where(status: 4).count

    # progress per tasks
    count = self.tasks.count
    done = self.tasks.where(status: 4).count

    if count > 0
      return done * 100 / count
    else
      return 0
    end
  end
end
