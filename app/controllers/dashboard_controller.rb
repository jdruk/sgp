class DashboardController < ApplicationController
  def index
    @skills = Ability.all
  end
end
