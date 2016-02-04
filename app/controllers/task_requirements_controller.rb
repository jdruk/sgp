class TaskRequirementsController < ApplicationController
  before_action :set_task_requirement, only: [:show, :edit, :update, :destroy]
  before_filter do
    redirect_to no_project_selected_path unless has_project_selected?
  end

  # GET /task_requirements
  # GET /task_requirements.json
  def index
    @task_requirements = TaskRequirement.all
  end

  # GET /task_requirements/1
  # GET /task_requirements/1.json
  def show
  end

  # GET /task_requirements/new
  def new
    @task_requirement = TaskRequirement.new
  end

  # GET /task_requirements/1/edit
  def edit
  end

  # POST /task_requirements
  # POST /task_requirements.json
  def create
    @task_requirement = TaskRequirement.new(task_requirement_params)

    respond_to do |format|
      if @task_requirement.save
        format.html { redirect_to @task_requirement, notice: 'Task requirement was successfully created.' }
        format.json { render :show, status: :created, location: @task_requirement }
      else
        format.html { render :new }
        format.json { render json: @task_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_requirements/1
  # PATCH/PUT /task_requirements/1.json
  def update
    respond_to do |format|
      if @task_requirement.update(task_requirement_params)
        format.html { redirect_to @task_requirement, notice: 'Task requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_requirement }
      else
        format.html { render :edit }
        format.json { render json: @task_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_requirements/1
  # DELETE /task_requirements/1.json
  def destroy
    @task_requirement.destroy
    respond_to do |format|
      format.html { redirect_to task_requirements_url, notice: 'Task requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_requirement
      @task_requirement = TaskRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_requirement_params
      params.require(:task_requirement).permit(:level, :task_id, :ability_id)
    end
end
