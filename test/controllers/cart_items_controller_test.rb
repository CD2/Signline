require 'test_helper'

class CartItemsControllerTest < ActionController::TestCase
  test "should create cart_item" do
    assert_difference('CartItem.count') do
      post :create, product_id: products(:one).id
    end

    assert_redirected_to products(:one)
  end
end
