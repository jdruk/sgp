require 'test_helper'

class FunctionUserProjectsControllerTest < ActionController::TestCase
  setup do
    @function_user_project = function_user_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:function_user_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create function_user_project" do
    assert_difference('FunctionUserProject.count') do
      post :create, function_user_project: { function_id: @function_user_project.function_id, project_id: @function_user_project.project_id, user_id: @function_user_project.user_id }
    end

    assert_redirected_to function_user_project_path(assigns(:function_user_project))
  end

  test "should show function_user_project" do
    get :show, id: @function_user_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @function_user_project
    assert_response :success
  end

  test "should update function_user_project" do
    patch :update, id: @function_user_project, function_user_project: { function_id: @function_user_project.function_id, project_id: @function_user_project.project_id, user_id: @function_user_project.user_id }
    assert_redirected_to function_user_project_path(assigns(:function_user_project))
  end

  test "should destroy function_user_project" do
    assert_difference('FunctionUserProject.count', -1) do
      delete :destroy, id: @function_user_project
    end

    assert_redirected_to function_user_projects_path
  end
end
