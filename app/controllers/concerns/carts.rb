module Carts

  def create_cart
    cart = Cart.create!
    session[:cart] = cart.id
    return cart
  end

  def current_cart
    Cart.find_by(id: session[:cart])
  end

  def retrieve_or_create_cart
    current_cart || create_cart
  end

end