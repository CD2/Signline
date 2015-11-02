class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create]
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
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    if @order.save
      @order.set_step "checkout"
      session[:order_id] = @order.id
      checkout_navigation
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
    checkout_navigation
    else
      @order.build_billing_address unless @order.billing_address
      @order.build_shipping_address unless @order.shipping_address
      render :edit
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
      params.require(:order).permit(:user_id, :ship_to_billing_address, :use_saved_billing_address, :use_saved_shipping_address, :shipping_address_id, :payment_type, :shipping_type, :new_account_name, :new_account_email,
          billing_address_attributes: [:id, :address_one, :address_two, :city, :county, :postcode, :country], 
          shipping_address_attributes: [:id, :address_one, :address_two, :city, :county, :postcode, :country])
    end
end
