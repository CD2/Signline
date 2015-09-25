require 'test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @admin_user = users(:admin_user)
  end

  test "should get index" do
    log_in_as @admin_user
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    log_in_as @admin_user
    get :new
    assert_response :success
  end

  test "should create category" do
    log_in_as @admin_user
    assert_difference('Category.count') do
      post :create, category: { machine_name: "#{@category.machine_name} unique", name: @category.name, site_id: @category.site_id }
    end

    assert_redirected_to admin_categories_path
  end

  test "should get edit" do
    log_in_as @admin_user
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    log_in_as @admin_user
    patch :update, id: @category, category: { machine_name: "#{@category.machine_name} unique2", name: @category.name, site_id: @category.site_id }
    assert_redirected_to admin_categories_path
  end

  test "should destroy category" do
    log_in_as @admin_user
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to admin_categories_path
  end
end

