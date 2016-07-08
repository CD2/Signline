class CartItemsController < ApplicationController

  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @cart << product
    @cart.update_item product, params[:order_item][:quantity].to_i
    redirect_to product
  end

  def update
    quantity = params[:commit] == "Remove" ? 0 : params[:order_item][:quantity].to_i
    @cart.update_item params[:id], quantity
    redirect_to carts_path
  end

  def destroy
    @cart.remove params[:id]
    redirect_to carts_path
  end

  private

  def set_cart
    @cart = retrieve_or_create_cart
  end

  def cart_item_params
    params.require(:order_item).permit(:quantity)
  end

end
