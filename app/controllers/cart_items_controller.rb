class CartItemsController < ApplicationController
  before_action :set_cart, only: :create

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      redirect_to product
    else
      render 'new'
    end
  end

  def update
    @line_item = CartItem.find(params[:id])
    @cart = @line_item.cart 
    if @line_item.update(cart_item_params)
      flash[:success] = "Cart update"
    else 
      flash[:notice] = "Could not update cart, please try again"
    end
    redirect_to carts_path
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
    end

end
