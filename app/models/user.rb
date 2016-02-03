class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum group: [:admin, :normal_user]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :languages, through: :user_languages
  has_many :abilities, through: :user_abilities
  has_many :function_user_projects
  has_many :functions, through: :function_user_projects
  has_many :projects, through: :function_user_projects
  has_many :user_languages
  has_many :user_abilities
  belongs_to :local
  has_and_belongs_to_many :tasks

end
