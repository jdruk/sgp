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
  validates :local_id, presence: true
end
