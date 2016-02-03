class Local < ActiveRecord::Base
	has_many :users
	has_many :projects

	validates :name, presence: true
	validates :country, presence: true
	validates :state, presence: true
	validates :city, presence: true
	validates :zip_code, presence: true
end
