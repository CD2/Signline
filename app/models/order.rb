class Order < ActiveRecord::Base

  belongs_to :user
  has_many :cart_items
  
  enum status: [:cart, :checkout, :confirmation]
  enum payment_type: [:standard :free]
  enum shipping_type: [:paypal, :sagepay]

  def self.get_cart
    Order.find(session[:cart])

  
  end


end
