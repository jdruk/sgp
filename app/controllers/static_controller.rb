class StaticController < ApplicationController
  before_action :go_to_home, only: [:index]

  def home_page
    render 'static/index'
  end

  private
    def go_to_home
        redirect_to dashboard_path if user_signed_in?
    end
end
