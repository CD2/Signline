class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def method_missing name, *args
    product.try name, *args
  end

  def in_cart?
    order.cart?
  end

  def unit_price
    in_cart? ? product.unit_price : super
  end

  def total_price
    quantity * unit_price
  end

  def finalize!
    self.name = product.name
    self.unit_price = product.unit_price
    self.unit_cost_price = product.unit_cost_price
    self.tax_rate = product.tax_rate
    save!
  end

end
