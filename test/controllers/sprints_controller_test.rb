require 'test_helper'

class SprintsControllerTest < ActionController::TestCase
  setup do
    @sprint = sprints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sprints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sprint" do
    assert_difference('Sprint.count') do
      post :create, sprint: { end_date: @sprint.end_date, execution_end_date: @sprint.execution_end_date, execution_start_date: @sprint.execution_start_date, planning_end_date: @sprint.planning_end_date, planning_start_date: @sprint.planning_start_date, project_id: @sprint.project_id, release_id: @sprint.release_id, retrospective_meeting_date: @sprint.retrospective_meeting_date, review_meeting_date: @sprint.review_meeting_date, start_date: @sprint.start_date }
    end

    assert_redirected_to sprint_path(assigns(:sprint))
  end

  test "should show sprint" do
    get :show, id: @sprint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sprint
    assert_response :success
  end

  test "should update sprint" do
    patch :update, id: @sprint, sprint: { end_date: @sprint.end_date, execution_end_date: @sprint.execution_end_date, execution_start_date: @sprint.execution_start_date, planning_end_date: @sprint.planning_end_date, planning_start_date: @sprint.planning_start_date, project_id: @sprint.project_id, release_id: @sprint.release_id, retrospective_meeting_date: @sprint.retrospective_meeting_date, review_meeting_date: @sprint.review_meeting_date, start_date: @sprint.start_date }
    assert_redirected_to sprint_path(assigns(:sprint))
  end

  test "should destroy sprint" do
    assert_difference('Sprint.count', -1) do
      delete :destroy, id: @sprint
    end

    assert_redirected_to sprints_path
  end
end
