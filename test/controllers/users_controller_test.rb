require 'test_helper'

class UserSystem::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:user)
    @other_user = users(:second_user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show user" do
    log_in_as @user
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    log_in_as @user
    get :edit, id: @user
    assert_response :success
  end

  test "should not show user if not signed in and not right user" do
    get :show, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
    log_in_as @other_user
    get :show, id: @user 
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should get edit if not signed in and not right user" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
    log_in_as @other_user
    get :edit, id: @user 
    assert_not flash.empty?
    assert_redirected_to root_url    
  end

end
