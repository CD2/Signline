require 'test_helper'

class ProductImportsControllerTest < ActionController::TestCase
  setup do
    @product_import = product_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_import" do
    assert_difference('ProductImport.count') do
      post :create, product_import: { file: @product_import.file }
    end

    assert_redirected_to product_import_path(assigns(:product_import))
  end

  test "should show product_import" do
    get :show, id: @product_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_import
    assert_response :success
  end

  test "should update product_import" do
    patch :update, id: @product_import, product_import: { file: @product_import.file }
    assert_redirected_to product_import_path(assigns(:product_import))
  end

  test "should destroy product_import" do
    assert_difference('ProductImport.count', -1) do
      delete :destroy, id: @product_import
    end

    assert_redirected_to product_imports_path
  end
end
