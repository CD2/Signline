module Carts

  def create_cart
    cart = Cart.create!
    session[:cart] = cart.id
    return cart
  end

  def current_cart
    #cart = Cart.find_by(id: session[:cart]) || create_cart
  end

end