class UserStory < ActiveRecord::Base
  belongs_to :theme
  belongs_to :sprint
end
