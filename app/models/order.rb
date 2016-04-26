class Order < ActiveRecord::Base

  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'

  enum order_status: [:cart, :pending, :processing, :complete]
  enum payment_type: [:standard, :free]
  enum shipping_type: [:paypal, :sagepay]


  def total_price
    order_items.inject(0){|t,i| t + i.total_price }
  end


  def total_price_in_pence
    (total_price*100).to_int
  end

end
