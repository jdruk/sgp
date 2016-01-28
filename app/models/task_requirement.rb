class TaskRequirement < ActiveRecord::Base
  belongs_to :task
  belongs_to :ability
end
