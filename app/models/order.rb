class Order < ActiveRecord::Base
  attr_accessor :ship_to_billing_address, :use_saved_billing_address, :use_saved_shipping_address

  SHIPPING_TYPES = %w[Standard Free]
  PAYMENT_TYPES = %w[PayPal SagePay]

  has_many :cart_items, dependent: :destroy
  belongs_to :billing_address, class_name: "Address", foreign_key: "billing_address_id"
  belongs_to :shipping_address, class_name: "Address", foreign_key: "shipping_address_id"

  accepts_nested_attributes_for :billing_address, reject_if: :use_preexisting_billing_address
  accepts_nested_attributes_for :shipping_address, reject_if: :use_preexisting_shipping_address

  validates :name, :email, presence: true

  def purchase
    response = EXPRESS_GATEWAY.purchase(self.total_in_pence, express_purchase_options)
    puts response.inspect
    if response.success?
      self.amount = self.total_in_pence
      self.purchased_at = Time.now
      self.save
    end
    response.success?
  end

  def express_token=(token)
    self[:express_token] = token
    unless token.blank?
      # you can dump details var if you need more info from buyer
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end

  def express_purchase_options
    {
        :ip => ip,
        :token => express_token,
        :payer_id => express_payer_id,
        :currency => 'GBP'
    }
  end

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
    %w[checkout confirmation]
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

  def sub_total
    cart_items.to_a.sum { |item| item.total_price }
  end

  def shipping
    5.0
  end

  def total
    sub_total + shipping
  end

  def total_in_pence
    (sub_total + shipping)*100.to_i
  end

  def set_billing_as_shipping
    shipping_record = self.billing_address.dup
    shipping_record.save
    self.shipping_address_id = shipping_record.id
    self.save
  end


end
