class UserStoryAcceptanceCriterionsController < ApplicationController
  before_action :set_user_story_acceptance_criterion, only: [:show, :edit, :update, :destroy]
  before_filter do
    redirect_to no_project_selected_path unless has_project_selected?
  end

  # GET /user_story_acceptance_criterions
  # GET /user_story_acceptance_criterions.json
  def index
    @user_story_acceptance_criterions = UserStoryAcceptanceCriterion.all
  end

  # GET /user_story_acceptance_criterions/1
  # GET /user_story_acceptance_criterions/1.json
  def show
  end

  # GET /user_story_acceptance_criterions/new
  def new
    @user_story_acceptance_criterion = UserStoryAcceptanceCriterion.new
  end

  # GET /user_story_acceptance_criterions/1/edit
  def edit
  end

  # POST /user_story_acceptance_criterions
  # POST /user_story_acceptance_criterions.json
  def create
    @user_story_acceptance_criterion = UserStoryAcceptanceCriterion.new(user_story_acceptance_criterion_params)

    respond_to do |format|
      if @user_story_acceptance_criterion.save
        format.html { redirect_to user_stories_path }
      else
        format.html { redirect_to user_stories_path, notice: 'NÃO foi possível salvar!' }
        #format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_story_acceptance_criterion.update(user_story_acceptance_criterion_params)
        format.html { redirect_to @user_story_acceptance_criterion, notice: 'Critério de aceitação salvo com sucesso!' }
      else
        format.html { redirect_to @user_story_acceptance_criterion, notice: 'NÃO foi possível salvar!' }
        #format.html { render :edit }
      end
    end
  end

  def destroy
    @user_story_acceptance_criterion.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story_acceptance_criterion
      @user_story_acceptance_criterion = UserStoryAcceptanceCriterion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_acceptance_criterion_params
      params.require(:user_story_acceptance_criterion).permit(:description, :status, :user_story_id)
    end
end
