class Cart < Order

  default_scope { cart }

  alias_method :cart_items, :order_items

  enum checkout_status: [:constructing, :address, :shipping, :payment, :complete]

  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address, reject_if: :same_shipping_address

  #VALIDATIONS##################################
  #this is gonna get messy
  def same_shipping_address
    same_shipping_address?
  end

  with_options if: :address? do |cart|
    # cart.validates :billing_address, presence: true
    # cart.validates_associated :billing_address
    # cart.validates :shipping_address, presence: true
    # cart.validates_associated :shipping_address, unless: :same_shipping_address?, message: 'TEST'
  end

  with_options if: :shipping? do |cart|

  end

  with_options if: :payment? do |cart|
    
  end

  #check all previous for possible changes
  with_options if: :complete? do |cart|

  end

  def empty?
    order_items.empty?
  end

  def self.get id
    cart = find_by(id: id)
  end

  def total_price
    cart_items.inject(0){|t,i| t + i.total_price }
  end

  def amount_of_items
    cart_items.pluck(:quantity).sum
  end

  def include? product
    products.include? product
  end


  ###EDIT CART######

  def << product
    if include? product
      cart_item = cart_items.find_by(product_id: product.id)
      cart_item.update_attributes(quantity: cart_item.quantity+1)
    else
      products << product
    end
  end

  def remove cart_item_id
    cart_items.find(cart_item_id).destroy
  end

  def update_item cart_item_id, quantity
    if quantity<=0
      remove cart_item_id
    else
      cart_items.find(cart_item_id).update_attributes(quantity: quantity)
    end
  end


  ###CHECKOUT#####

  def address_prepare
    build_billing_address if billing_address.nil?
    build_shipping_address if shipping_address.nil?
  end

  def next_stage
    return false if complete?
    Cart.checkout_statuses[self.checkout_status] + 1
  end

  def next_stage!
    return false if self.complete?
    self.checkout_status = next_stage
    self.send :try, "#{checkout_status}_prepare"
  end

  def checkout
    cart_items.each do |cart_item|
      cart_item.finalize!
    end
    pending!
    return true
  rescue
    return false
  end

end