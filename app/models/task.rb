class Task < ActiveRecord::Base
	# enum status: [:development, :pendent, :completed]

	belongs_to :user_story
	#has_and_belongs_to_many :users

  has_many :users_tasks, dependent: :destroy
  has_many :users, through: :users_tasks

  has_many :task_requirements, dependent: :destroy
	has_many :abilities, through: :task_requirements

	validates :description, presence: true
	# validates :end_date, presence: true
	# validates :start_date, presence: true
	validates :status, presence: true
	validates :user_story_id, presence: true

  def status_label
    labels = {1 => 'Pendente', 2 => 'Desenvolvimento', 3 => 'Teste', 4 => 'Concluída', 5 => 'Depreciada'}
    return labels[self.status]
  end
end
