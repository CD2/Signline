class CartsController < ApplicationController
  before_action :set_cart

  def index
    @cart = Order.current_cart
  end

  def edit

  end

  def update

  end

  def destroy
    @cart = current_cart
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    destroy_order
    redirect_to root_url
    flash[:notice] = 'Your cart is now empty.'
  end

  def add

  end

  def checkout
  end

  private

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params[:cart]
    end
    
end
