class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum group: [:admin, :normal_user]

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  has_many :user_languages, dependent: :destroy
  has_many :languages, through: :user_languages
  
  has_many :user_abilities, dependent: :destroy
  has_many :abilities, through: :user_abilities
  
  has_many :function_user_projects, dependent: :destroy
  has_many :functions, through: :function_user_projects
  has_many :projects, through: :function_user_projects

  has_many :participants, dependent: :destroy
  has_many :user_stories, through: :participants

  has_many :users_tasks, dependent: :destroy
  has_many :tasks, through: :users_tasks

  has_many :notifications
  
  belongs_to :local
  #has_and_belongs_to_many :tasks

  def skill_level(xp)
    # curva de experiência
    # xp = []; (1..10).each {|i| xp << 2 ** i}; p xp

    xp_levels = []; (1..10).each {|i| xp_levels << 2 ** i}

    level = 0
    xp_levels.each_with_index { |xpl, i| level = i + 1 if xpl <= xp && xp > 0 }
    return level
  end

  def xp_required_to_next_level(skill_level)
    xp_levels = []; (1..10).each {|i| xp_levels << 2 ** i}
    return xp_levels[skill_level]
  end

  def xp(skill)
    xp_count = 0

    skill.tasks.each do |task|
      unless task.users.where(id: self.id).empty?
        xp_count += task.user_story.story_points
      end
    end

    return xp_count
  end

  def self.rank
    # por quantidade de tarefas
    # User.includes(:tasks).where(tasks: {status: 4}).order("count_id desc").group(:name).count

    # por pontos de XP
    query = "SELECT SUM('user_stories'.'story_points') AS sum_story_points, 'users'.'name' AS name FROM 'users' LEFT OUTER JOIN 'users_tasks' ON 'users_tasks'.'user_id' = 'users'.'id' LEFT OUTER JOIN 'tasks' ON 'tasks'.'id' = 'users_tasks'.'task_id' LEFT OUTER JOIN 'user_stories' ON 'user_stories'.'id' = 'tasks'.'user_story_id' WHERE 'users'.'group' = 1 GROUP BY 'users'.'name'  ORDER BY sum_story_points desc"
    connection = ActiveRecord::Base.connection
    connection.execute(query)
  end
end
