class TaskRequirement < ActiveRecord::Base
  belongs_to :task
  belongs_to :ability

  # validates :level, presence: true
  # validates :task_id, presence: true
  # validates :ability_id, presence: true
end
