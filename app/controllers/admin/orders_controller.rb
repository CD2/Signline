class Admin::OrdersController < AdminController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :print, :dispatch_order, :update_tracking, :flag, :resolve_flag, :duplicate, :resend_emails]

  def index
    @orders = Order.all
  end

  def manage
    @order = Order.find_by(id: params[:order_id]) || Order.new
  end

  def print
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @order.pending!
      redirect_to manage_admin_orders_path(order_id: @order)
      flash[notice] = 'Order was successfully created.'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to manage_admin_orders_path(order_id: @order)
      flash[notice] = 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_url, notice: 'Order was successfully destroyed.'
  rescue
    redirect_to admin_orders_url, notice: 'Cannot delete order, order item etyc.'
  end

  def flag
    @order.issue_raised!
    redirect_to manage_admin_orders_path(order_id: @order)
  end

  def resolve_flag
    @order.resolved!
    redirect_to manage_admin_orders_path(order_id: @order)
  end

  def resend_emails
    OrderMailer.notify_signline(@order).deliver_now
    OrderMailer.notify_buyer(@order).deliver_now
    redirect_to manage_admin_orders_path(order_id: @order), notice: 'Emails sent'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
        :first_name, :last_name, :company, :billing_address_id, :email_address, :phone_number, :status, :received_at,
        :accepted_at, :shipped_at, :delivery_service_id, :delivery_price, :delivery_cost_price, :delivery_tax_rate,
        :delivery_tax_amount, :accepted_by, :shipped_by, :consignment_number, :rejected_at, :rejected_by,
        :ip_address, :separate_delivery_address, :shipping_address_id, :amount_paid, :exported, :invoice_number, :payment_method,
        :customer_id, :sales_channel, :tracking_details, order_items_attributes: [:id, :product_id, :quantity, :unit_price, :tax_rate],
        notes_attributes: [:id, :body, :user_id]
    )
  end

end