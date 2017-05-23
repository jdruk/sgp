class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:show, :edit, :update, :destroy]
  before_filter do
    redirect_to no_project_selected_path unless has_project_selected?
  end

  def index
    @user_stories = UserStory.where(project_id: current_project_id)
    @criterion = UserStoryAcceptanceCriterion.new
    @task = Task.new
  end

  def show
  end

  def new
    @user_story = UserStory.new
  end

  def edit
  end

  def create
    @user_story = UserStory.new(user_story_params)
    @user_story.project_id = current_project_id


    theme = Theme.where(project_id: current_project_id, name: params[:user_story][:theme_search]).first
    
    unless params[:user_story][:theme_search].empty?
      if theme.nil?
        theme = Theme.create(name: params[:user_story][:theme_search], description: '', project_id: current_project_id)
        @user_story.theme_id = theme.id
      else
        @user_story.theme_id = theme.id
      end
    end

    respond_to do |format|
      if @user_story.save
        format.html { redirect_to @user_story, notice: 'User story was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    # se o campo tema não for preenchido, ignora
    # caso sim, verifica se o tema já existe, se não então cria
    theme = Theme.where(project_id: current_project_id, name: params[:user_story][:theme_search]).first

    unless params[:user_story][:theme_search].empty?
      if theme.nil?
        theme = Theme.create(name: params[:user_story][:theme_search], description: '', project_id: current_project_id)
        @user_story.theme_id = theme.id
      else
        @user_story.theme_id = theme.id
      end
    end

    respond_to do |format|
      if @user_story.update(user_story_params)
        format.html { redirect_to @user_story, notice: 'User story was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: 'User story was successfully destroyed.' }
    end
  end

  private
    def set_user_story
      @user_story = UserStory.where(id: params[:id], project_id: current_project_id).first

      if @user_story.nil?
        redirect_to releases_url, notice: 'User story not found.'
      end
    end

    def user_story_params
      params.require(:user_story).permit(:description, :business_value, :story_points, :status, :sprint_id)
    end
end
