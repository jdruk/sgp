class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:show, :edit, :update, :destroy]
  before_filter do
    redirect_to no_project_selected_path unless has_project_selected?
  end

  # GET /user_stories
  # GET /user_stories.json
  def index
    @user_stories = UserStory.where(project_id: current_project_id)
  end

  # GET /user_stories/1
  # GET /user_stories/1.json
  def show
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
  end

  # GET /user_stories/1/edit
  def edit
  end

  # POST /user_stories
  # POST /user_stories.json
  def create
    @user_story = UserStory.new(user_story_params)
    @user_story.project_id = current_project_id

    theme = Theme.where(project_id: current_project_id, name: params[:user_story][:theme_search])

    if theme.empty?
      theme = Theme.create(name: params[:user_story][:theme_search], description: '', project_id: current_project_id)
      @user_story.theme_id = theme.id
    else
      @user_story.theme_id = theme.id
    end

    respond_to do |format|
      if @user_story.save
        format.html { redirect_to @user_story, notice: 'User story was successfully created.' }
        format.json { render :show, status: :created, location: @user_story }
      else
        format.html { render :new }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_stories/1
  # PATCH/PUT /user_stories/1.json
  def update
    respond_to do |format|
      if @user_story.update(user_story_params)
        format.html { redirect_to @user_story, notice: 'User story was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_stories/1
  # DELETE /user_stories/1.json
  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: 'User story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story = UserStory.where(id: params[:id], project_id: current_project_id).first

      if @user_story.nil?
        redirect_to releases_url, notice: 'User story not found.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_params
      params.require(:user_story).permit(:description, :business_value, :story_points, :status, :sprint_id)
    end
end
