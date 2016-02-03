class FunctionUserProjectsController < ApplicationController
  before_action :set_function_user_project, only: [:show, :edit, :update, :destroy]
  before_filter do
    redirect_to no_project_selected_path unless has_project_selected?
  end

  # GET /function_user_projects
  # GET /function_user_projects.json
  def index
    @function_user_projects = FunctionUserProject.where(project_id: current_project_id)
  end

  # GET /function_user_projects/1
  # GET /function_user_projects/1.json
  def show
  end

  # GET /function_user_projects/new
  def new
    @function_user_project = FunctionUserProject.new
  end

  # GET /function_user_projects/1/edit
  def edit
  end

  # POST /function_user_projects
  # POST /function_user_projects.json
  def create
    @function_user_project = FunctionUserProject.new(function_user_project_params)
    @function_user_project.project_id = current_project_id
    respond_to do |format|
      if @function_user_project.save
        format.html { redirect_to @function_user_project, notice: 'Function user project was successfully created.' }
        format.json { render :show, status: :created, location: @function_user_project }
      else
        format.html { render :new }
        format.json { render json: @function_user_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /function_user_projects/1
  # PATCH/PUT /function_user_projects/1.json
  def update
    respond_to do |format|
      if @function_user_project.update(function_user_project_params)
        format.html { redirect_to @function_user_project, notice: 'Function user project was successfully updated.' }
        format.json { render :show, status: :ok, location: @function_user_project }
      else
        format.html { render :edit }
        format.json { render json: @function_user_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /function_user_projects/1
  # DELETE /function_user_projects/1.json
  def destroy
    @function_user_project.destroy
    respond_to do |format|
      format.html { redirect_to function_user_projects_url, notice: 'Function user project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_function_user_project
      @function_user_project = FunctionUserProject.where(id: params[:id], project_id: current_project_id).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def function_user_project_params
      params.require(:function_user_project).permit(:function_id, :user_id)
    end
end
