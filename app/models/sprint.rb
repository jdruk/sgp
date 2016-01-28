class Sprint < ActiveRecord::Base
  belongs_to :project
  belongs_to :release
end
