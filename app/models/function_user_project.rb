class FunctionUserProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :function

  validates :validate_function_user_project, acceptance: { accept: true }

  def validate_function_user_project
  	if FunctionUserProject.where(function_id: self.function_id,project_id: self.project_id, user_id: self.user_id).first
  		false
  	else
  		true
  	end
  end
end
