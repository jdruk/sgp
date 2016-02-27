class Project < ActiveRecord::Base
  belongs_to :local
  has_many :themes
  has_many :sprints
  has_many :releases
  has_many :user_stories
  has_many :function_user_projects
  has_many :functions, through: :function_user_projects
  has_many :users, through: :function_user_projects

  validates :name, presence: true
  validates :size, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

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
end
