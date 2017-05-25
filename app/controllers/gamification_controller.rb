class GamificationController < ApplicationController
  def achievements
  end

  def ranks
    @ranks = User.rank
  end
end
