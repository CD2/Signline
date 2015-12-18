class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create, :update]
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @order = current_order || Order.new
    @order.set_step "checkout" if current_order
    @billing_address = @order.billing_address || @order.build_billing_address
    @shipping_address = @order.shipping_address || @order.build_shipping_address
    if @cart.cart_items.empty?
      redirect_to carts_path
      return
    end
  end

  # GET /orders/1/edit
  def edit
    render :new
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    if @order.save
      @order.set_step "checkout"
      session[:order_id] = @order.id
      @order.set_billing_as_shipping if params[:order][:ship_to_billing_address]
      checkout_navigation
      set_up_user
    else
      @order.build_billing_address unless @order.billing_address
      @order.build_shipping_address unless @order.shipping_address
      render :new
    end
  end

  def shipping_method
    @order = Order.find(params[:order_id])
    @order.set_step "shipping"
    rescue ActiveRecord::RecordNotFound
      redirect_to carts_path
  end

  def summary
    @order = Order.find(params[:order_id])
    @items = @order.cart_items.map{|x| x.quantity }
    @order.set_step "confirmation"
    rescue ActiveRecord::RecordNotFound
      redirect_to carts_path
  end

  # GET /orders/1
  def show

  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      @order.add_line_items_from_cart(@cart)
      @order.set_billing_as_shipping if params[:order][:ship_to_billing_address]
      checkout_navigation
    else
      @order.build_billing_address unless @order.billing_address
      @order.build_shipping_address unless @order.shipping_address
      render :new
    end
  end

  def express_checkout
    @order = Order.find(params[:order_id])
    response = EXPRESS_GATEWAY.setup_purchase(@order.total_in_pence,
                                              ip: request.remote_ip,
                                              return_url: order_purchase_url(@order),
                                              cancel_return_url: root_url,
                                              currency: "GBP",
                                              allow_guest_checkout: true,
                                              items: [{name: "Order", description: "Order description", quantity: "1", amount: @order.total_in_pence}]
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def purchase
    @order = Order.find(params[:order_id])
    @order.update_attributes(:express_token => params[:token])
    if @order.purchase # this is where we purchase the order. refer to the model method below
      OrderMailer.notify_signline(@order).deliver_now
      OrderMailer.notify_buyer(@order).deliver_now
      redirect_to order_url(@order)
    else
      render :action => "failure"
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  def hook
    session[:cart_id] = nil
    session[:order_id] = nil
    Cart.destroy(session[:cart_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_up_user
      name = params[:new_account_name]
      email = params[:new_account_email]
    end

    def checkout_navigation
      if params[:to_checkout]
        redirect_to new_order_path
      elsif params[:to_shipping]
        redirect_to order_shipping_method_path @order
      elsif params[:to_summary]
        redirect_to order_summary_path @order
      end
    end



    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, :ship_to_billing_address, :use_saved_billing_address, :use_saved_shipping_address, :shipping_address_id, :payment_type, :shipping_type, :name, :email,
          billing_address_attributes: [:id, :address_one, :address_two, :city, :county, :postcode, :country], 
          shipping_address_attributes: [:id, :address_one, :address_two, :city, :county, :postcode, :country])
    end
end
