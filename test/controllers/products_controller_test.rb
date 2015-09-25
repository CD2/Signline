require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

end
