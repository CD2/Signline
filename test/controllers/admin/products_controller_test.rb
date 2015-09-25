require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @admin_user = users(:admin_user)
  end

  test "should get index" do
    log_in_as @admin_user
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    log_in_as @admin_user
    get :new
    assert_response :success
  end

  test "should create product" do
    log_in_as @admin_user
    assert_difference('Product.count') do
      post :create, product: { body: @product.body, name: "#{@product.name} unique", price: @product.price }
    end

    assert_redirected_to admin_products_path
  end

  test "should get edit" do
    log_in_as @admin_user
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    log_in_as @admin_user
    patch :update, id: @product, product: { body: @product.body, name: @product.name, price: @product.price }
    assert_redirected_to admin_products_path
  end

  test "should destroy product" do
    log_in_as @admin_user
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to admin_products_path
  end
end
