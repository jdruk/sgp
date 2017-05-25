# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model
  belongs_to :user



  # Write your custom methods...
end
