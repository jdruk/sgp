class Theme < ActiveRecord::Base
  belongs_to :project
  has_many :user_stories

  validates :name, presence: true
  validates :project_id, presence: true
end
