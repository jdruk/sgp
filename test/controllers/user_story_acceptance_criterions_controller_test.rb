require 'test_helper'

class UserStoryAcceptanceCriterionsControllerTest < ActionController::TestCase
  setup do
    @user_story_acceptance_criterion = user_story_acceptance_criterions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_story_acceptance_criterions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_story_acceptance_criterion" do
    assert_difference('UserStoryAcceptanceCriterion.count') do
      post :create, user_story_acceptance_criterion: { description: @user_story_acceptance_criterion.description, status: @user_story_acceptance_criterion.status, user_story_id: @user_story_acceptance_criterion.user_story_id }
    end

    assert_redirected_to user_story_acceptance_criterion_path(assigns(:user_story_acceptance_criterion))
  end

  test "should show user_story_acceptance_criterion" do
    get :show, id: @user_story_acceptance_criterion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_story_acceptance_criterion
    assert_response :success
  end

  test "should update user_story_acceptance_criterion" do
    patch :update, id: @user_story_acceptance_criterion, user_story_acceptance_criterion: { description: @user_story_acceptance_criterion.description, status: @user_story_acceptance_criterion.status, user_story_id: @user_story_acceptance_criterion.user_story_id }
    assert_redirected_to user_story_acceptance_criterion_path(assigns(:user_story_acceptance_criterion))
  end

  test "should destroy user_story_acceptance_criterion" do
    assert_difference('UserStoryAcceptanceCriterion.count', -1) do
      delete :destroy, id: @user_story_acceptance_criterion
    end

    assert_redirected_to user_story_acceptance_criterions_path
  end
end
