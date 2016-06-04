class Cart < Order

  default_scope { cart }

  alias_method :cart_items, :order_items

  enum checkout_status: [:constructing, :address, :payment, :complete]

  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :shipping_address, reject_if: :same_shipping_address

  #VALIDATIONS##################################
  #this is gonna get messy
  def same_shipping_address
    same_shipping_address?
  end


  def empty?
    order_items.empty?
  end

  def self.get id
    cart = find_by(id: id)
  end

  def amount_of_items
    cart_items.pluck(:quantity).sum
  end

  def include? product
    products.include? product
  end

  def find_item item
    return case item
    when OrderItem#CartItem
      item
    when Product
      cart_items.find_by(product_id: item.id)
    else
      cart_items.find(item)
    end
  end


  ###EDIT CART######

  def << product
    if include? product
      cart_item = find_item(product)
      update_item cart_item, cart_item.quantity+1
    else
      products << product
    end
  end

  def remove cart_item
    find_item(cart_item).destroy
  end

  def update_item cart_item, quantity
    cart_item = find_item(cart_item)
    if quantity<=0
      remove cart_item
    else
      cart_item.update_attributes(quantity: quantity)
    end
  end


  ###CHECKOUT#####

  def address_prepare
    build_billing_address if billing_address.nil?
    build_shipping_address if shipping_address.nil?
  end

  def next_stage
    Cart.checkout_statuses[self.checkout_status] + 1
  end

  def next_stage!
    return false if self.complete?
    self.checkout_status = next_stage
    self.send :try, "#{checkout_status}_prepare"
    return true
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

  def paypal_items
    cart_items.map &:paypal_item
  end

  def purchase
    response = EXPRESS_GATEWAY.purchase(total_price_in_pence, express_purchase_options)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      # you can dump details var if you need more info from buyer
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
    end
  end

  def update_order_items_cost
    order_items.each do |order_item|
      order_item.unit_price = order_item.product.unit_price
      order_item.save
    end
  end

  private

  def express_purchase_options
    {
      :ip => ip,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end

end