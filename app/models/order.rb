class Order < ActiveRecord::Base

  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'

  enum order_status: [:cart, :pending, :processing, :complete]
  enum payment_type: [:standard, :free]
  enum shipping_type: [:paypal, :sagepay]



end
