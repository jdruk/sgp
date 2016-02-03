class Function < ActiveRecord::Base
	has_many :function_user_projects
  	has_many :users, through: :function_user_projects
  	has_many :projects, through: :function_user_projects

  	validates :name, presence: true
  	validates :description, presence: true
end
