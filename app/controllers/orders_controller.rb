class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create, :update]

  def index
    @orders = Order.all
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

end
