class Order < ActiveRecord::Base
  attr_accessor :ship_to_billing_address, :use_saved_billing_address, :use_saved_shipping_address, :new_account_name, :new_account_email

  SHIPPING_TYPES = %w[Standard Free]
  PAYMENT_TYPES = %w[PayPal SagePay]

  has_many :cart_items, dependent: :destroy
  belongs_to :billing_address, class_name: "Address", foreign_key: "billing_address_id"
  belongs_to :shipping_address, class_name: "Address", foreign_key: "shipping_address_id"

  accepts_nested_attributes_for :billing_address, reject_if: :use_preexisting_billing_address
  accepts_nested_attributes_for :shipping_address, reject_if: :use_preexisting_shipping_address

  validates :new_account_name, :new_account_email, presence: true, unless: :user_id_present

  def add_line_items_from_cart(cart)
    cart.cart_items.each do |item|
      cart_items << item
    end
  end

  def use_preexisting_billing_address
    if self.use_saved_billing_address == "1"
      return true
    end
  end

  def use_preexisting_shipping_address
    if self.use_saved_shipping_address == "1" || self.ship_to_billing_address == "1"
      return true
    end
  end

  def user_id_present
    if self.user_id != nil 
      return true
    end
  end

  def steps
    %w[checkout shipping confirmation]
  end

  def current_step
    self.status
  end

  def next_step
    self.status = steps[steps.index(current_step)+1]
    self.save
  end

  def previous_step
    self.status = steps[steps.index(current_step)-1]
    self.save
  end 

  def set_step step 
    self.status = step 
    self.save
  end

end
