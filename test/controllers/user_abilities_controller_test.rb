require 'test_helper'

class UserAbilitiesControllerTest < ActionController::TestCase
  setup do
    @user_ability = user_abilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_abilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_ability" do
    assert_difference('UserAbility.count') do
      post :create, user_ability: { ability_id: @user_ability.ability_id, points: @user_ability.points, user_id: @user_ability.user_id }
    end

    assert_redirected_to user_ability_path(assigns(:user_ability))
  end

  test "should show user_ability" do
    get :show, id: @user_ability
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_ability
    assert_response :success
  end

  test "should update user_ability" do
    patch :update, id: @user_ability, user_ability: { ability_id: @user_ability.ability_id, points: @user_ability.points, user_id: @user_ability.user_id }
    assert_redirected_to user_ability_path(assigns(:user_ability))
  end

  test "should destroy user_ability" do
    assert_difference('UserAbility.count', -1) do
      delete :destroy, id: @user_ability
    end

    assert_redirected_to user_abilities_path
  end
end
