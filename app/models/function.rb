class Function < ActiveRecord::Base
	has_many :function_user_projects
  	has_many :users, through: :function_user_projects
  	has_many :projects, through: :function_user_projects
end
