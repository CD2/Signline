require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
    @product = products(:one)
  end

  test "should show cart" do
    get :index
    assert_select '.empty_cart', 'empty!'
    @line_item = @cart.add_product(@product.id)
    @line_item.save
    session[:cart_id] = @cart.id
    get :index
    assert_select 'h3', @product.name
    assert_response :success
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id
      delete :destroy, id: @cart
    end

    assert_redirected_to root_path
  end
end
