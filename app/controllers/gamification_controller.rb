class GamificationController < ApplicationController
  def achievements
    @skills = Ability.all

    @done_first_project = false

    current_user.projects.each do |project|
      @done_first_project = true if project.progress == 100
    end
  end

  def ranks
    @ranks = User.rank
  end
end
