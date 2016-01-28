class Project < ActiveRecord::Base
  belongs_to :local
  has_many :themes
  has_many :sprints
  has_many :releases
  has_many :function_user_projects
  has_many :functions, through: :function_user_projects
  has_many :users, through: :function_user_projects
end
