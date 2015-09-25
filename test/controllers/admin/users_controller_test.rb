require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:user)
    @admin_user = users(:admin_user)
  end

  test "should get index only when admin" do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
    log_in_as @admin_user
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new only when admin" do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url   
    log_in_as @admin_user
    get :new
    assert_response :success
  end

  test "should get edit only when admin" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
    log_in_as @admin_user
    get :new
    assert_response :success
  end

  test "should destroy user only when admin" do
    log_in_as @admin_user
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to admin_users_path
  end
end
