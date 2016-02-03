class UserAbility < ActiveRecord::Base
  belongs_to :user
  belongs_to :ability

  validates :points, presence: true
  validates :user_id, presence: true
  validates :ability_id, presence: true
end
