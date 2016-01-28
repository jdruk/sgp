class Theme < ActiveRecord::Base
  belongs_to :project
  has_many :user_stories
end
