class UserStoryAcceptanceCriterionsController < ApplicationController
  before_action :set_user_story_acceptance_criterion, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @user_story_acceptance_criterion, notice: 'User story acceptance criterion was successfully created.' }
        format.json { render :show, status: :created, location: @user_story_acceptance_criterion }
      else
        format.html { render :new }
        format.json { render json: @user_story_acceptance_criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_story_acceptance_criterions/1
  # PATCH/PUT /user_story_acceptance_criterions/1.json
  def update
    respond_to do |format|
      if @user_story_acceptance_criterion.update(user_story_acceptance_criterion_params)
        format.html { redirect_to @user_story_acceptance_criterion, notice: 'User story acceptance criterion was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story_acceptance_criterion }
      else
        format.html { render :edit }
        format.json { render json: @user_story_acceptance_criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_story_acceptance_criterions/1
  # DELETE /user_story_acceptance_criterions/1.json
  def destroy
    @user_story_acceptance_criterion.destroy
    respond_to do |format|
      format.html { redirect_to user_story_acceptance_criterions_url, notice: 'User story acceptance criterion was successfully destroyed.' }
      format.json { head :no_content }
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
