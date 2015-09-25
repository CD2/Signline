module CartsHelper

  def set_cart 
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def cart?
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    return false
  end

  def current_cart
    @cart = Cart.find(session[:cart_id])
  end

end
