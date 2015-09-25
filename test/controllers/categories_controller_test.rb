require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
    @product = @category.products.create(name: "Product", body: "Lipsom...", price: 4.11)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
    assert_select 'h3', 'Product'
    assert_select '.price', /\£[,\d]+\.\d\d/
  end

end
