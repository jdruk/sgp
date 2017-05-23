class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :select, :scrumboard]

  def select
    session[:project] = @project.id
    redirect_to @project
  end

  def deselect
    session[:project] = nil
    redirect_to projects_path
  end

  def scrumboard
    
  end

  def index
    if current_user.admin?
      @projects = Project.all
    else
      redirect_to user_project_path
    end
  end

  def user_project 
    @projects = current_user.projects
    render :index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    session[:project] = nil
    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :size, :start_date, :end_date, :local_id)
    end
end
