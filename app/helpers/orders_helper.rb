module OrdersHelper

  def destroy_order     
    @order = current_order
    @order.destroy if @order
    session[:order_id] = nil
  end

  def current_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    return nil
  end

end
