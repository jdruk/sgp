require 'test_helper'

class TaskRequirementsControllerTest < ActionController::TestCase
  setup do
    @task_requirement = task_requirements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_requirements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_requirement" do
    assert_difference('TaskRequirement.count') do
      post :create, task_requirement: { ability_id: @task_requirement.ability_id, level: @task_requirement.level, task_id: @task_requirement.task_id }
    end

    assert_redirected_to task_requirement_path(assigns(:task_requirement))
  end

  test "should show task_requirement" do
    get :show, id: @task_requirement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_requirement
    assert_response :success
  end

  test "should update task_requirement" do
    patch :update, id: @task_requirement, task_requirement: { ability_id: @task_requirement.ability_id, level: @task_requirement.level, task_id: @task_requirement.task_id }
    assert_redirected_to task_requirement_path(assigns(:task_requirement))
  end

  test "should destroy task_requirement" do
    assert_difference('TaskRequirement.count', -1) do
      delete :destroy, id: @task_requirement
    end

    assert_redirected_to task_requirements_path
  end
end
