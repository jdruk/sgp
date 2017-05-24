class StaticController < ApplicationController
  before_action :go_to_home, only: [:home_page]

  def home_page
    render 'static/index'
  end

  private
    def go_to_home
      if user_signed_in?
        if current_user.group == 'admin'
          redirect_to projects_path
        else
          redirect_to dashboard_path
          # redirect_to projects_path
        end
      end
    end
end
