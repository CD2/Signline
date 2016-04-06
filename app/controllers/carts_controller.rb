class CartsController < ApplicationController

  before_action :set_cart

  def index
    render 'empty_cart' if @cart.empty?
  end

  def add
    product = Product.find(params[:product_id])
    @cart << product
    redirect_to product
  end

  def remove
    @cart.remove params[:id]
    redirect_to carts_path
  end

  def update
    @cart.update_item params[:id], params[:order_item][:quantity].to_i
    redirect_to carts_path
  end


  def checkout
    unless @cart.next_stage!
      if @cart.checkout
        session[:cart_id] = nil
        redirect_to root_path
      else
        flash[:error] = 'Sorry, there was a problem processing your order.'
      end
      redirect_to root_url 
    end
  end

  def update_checkout
    if @cart.update(cart_params)
      @cart.checkout_status = @cart.next_stage
      @cart.save!
      redirect_to [:checkout, :carts]
    else
    @cart.next_stage!
    render :checkout
    end
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to root_url
    flash[:notice] = 'Your cart is now empty.'
  end

  private

    def cart_params
      params.require(:cart).permit :name, :email, :phone, :quantity,
        :same_shipping_address,
        billing_address_attributes: [:name, :address_one, :address_two, :city, :county, :postcode, :country],
        shipping_address_attributes: [:name, :address_one, :address_two, :city, :county, :postcode, :country]
    end

    def set_cart
      @cart = current_cart
    end
    
end
