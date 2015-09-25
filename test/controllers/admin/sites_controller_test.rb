require 'test_helper'

class Admin::SitesControllerTest < ActionController::TestCase
  setup do
    @site = sites(:one)
    @admin_user = users(:admin_user)
  end

  test "should get index" do
    get :index
    assert_not flash.empty?
    assert_redirected_to login_url
    log_in_as @admin_user
    get :index
    assert_response :success
    assert_not_nil assigns(:sites)
  end

  test "should get new" do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
    log_in_as @admin_user
    get :new
    assert_response :success
  end

  test "should create site" do
    log_in_as @admin_user
    assert_difference('Site.count') do
      post :create, site: { machine_name: "#{@site.machine_name} unique", name: @site.name, url: @site.url }
    end

    assert_redirected_to admin_sites_path
  end

  test "should get edit" do
    get :edit, id: @site
    assert_not flash.empty?
    assert_redirected_to login_url
    log_in_as @admin_user
    get :edit, id: @site
    assert_response :success
  end

  test "should update site" do
    log_in_as @admin_user
    patch :update, id: @site, site: { machine_name: @site.machine_name, name: @site.name, url: @site.url }
    assert_redirected_to admin_sites_path
  end

  test "should destroy site" do
    log_in_as @admin_user
    assert_difference('Site.count', -1) do
      delete :destroy, id: @site
    end

    assert_redirected_to admin_sites_path
  end
end
