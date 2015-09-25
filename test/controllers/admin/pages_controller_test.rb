require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:one)
    @admin_user = users(:admin_user)
  end

  test "should get index" do
    log_in_as @admin_user
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    log_in_as @admin_user
    get :new
    assert_response :success
  end

  test "should create page" do
    log_in_as @admin_user
    assert_difference('Page.count') do
      post :create, page: { body: @page.body, meta_description: @page.meta_description, name: @page.name, page_title: @page.page_title, published: @page.published, url_alias: @page.url_alias }
    end

    assert_redirected_to admin_pages_path
  end

  test "should get edit" do
    log_in_as @admin_user
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    log_in_as @admin_user
    patch :update, id: @page, page: { body: @page.body, meta_description: @page.meta_description, name: @page.name, page_title: @page.page_title, published: @page.published, url_alias: @page.url_alias }
    assert_redirected_to admin_pages_path
  end

  test "should destroy page" do
    log_in_as @admin_user
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to admin_pages_path
  end
end
