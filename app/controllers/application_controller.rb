class ApplicationController < ActionController::Base
  include Pundit
  include ProjectsHelper

  protect_from_forgery
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
end
