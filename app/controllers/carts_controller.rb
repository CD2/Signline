class CartsController < ApplicationController

  before_action :set_cart

  def show
    render 'empty_cart' if @cart.empty?
  end

  def checkout
    redirect_to root_url if @cart.empty?
    @cart.next_stage!
    if @cart.complete?
      if @cart.checkout
        redirect_to order_summary_path(@cart)
        session[:cart_id] = nil
      else
        flash[:error] = 'Sorry, there was a problem processing your order.'
      end
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


  ##########
  #PAYMENTS#
  ##########

  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase(@cart.total_price_in_pence,
      ip: request.remote_ip,
      return_url: paypal_complete_carts_url,
      cancel_return_url: cancel_payment_carts_url,
      currency: "GBP",
      allow_guest_checkout: true,
      items: @cart.paypal_items
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def paypal_complete
    @cart.update(express_token: params[:token])
    @cart.ip = request.remote_ip
    if @cart.save!
      if @cart.purchase
        redirect_to order_url(@cart)
      else
        render :action => "failure"
      end
    end
  end




  private

    def cart_params
      params.require(:cart).permit :name, :email, :phone,
        :same_shipping_address,
        billing_address_attributes: [:name, :address_one, :address_two, :city, :county, :postcode, :country],
        shipping_address_attributes: [:name, :address_one, :address_two, :city, :county, :postcode, :country]
    end

    def set_cart
      @cart = current_cart
    end
    
end
