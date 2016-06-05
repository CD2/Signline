class Order < ActiveRecord::Base
  belongs_to :delivery_service
  belongs_to :user
  has_many :order_items
  accepts_nested_attributes_for :order_items, allow_destroy: true
  has_many :products, through: :order_items
  has_many :notes
  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:body].blank? }

  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :billing_address, class_name: 'Address'


  default_scope -> { order created_at: :desc }

  scope :pending, -> { unscoped.awaiting_payment }
  scope :unprocessed, -> { awaiting_dispatch }
  scope :processed, -> { unscoped.dispatched }
  scope :ended, -> { unscoped.cancelled }
  scope :all_, -> { unscoped.order(created_at: :desc) }

  scope :flagged, -> { all_.where.not(flag: nil) }
  scope :issues, -> { all_.issue_raised }
  scope :resolved, -> { all_.resolved }

  enum order_status: [:cart, :pending, :processing, :complete]
  enum payment_type: [:standard, :free]
  enum shipping_type: [:paypal, :sagepay]
  enum flag: [:issue_raised, :resolved]

  def empty?
    order_items.empty?
  end

  def has_items?
    total_items > 0
  end

  def total_items
    order_items.inject(0) { |t, i| t + i.quantity }
  end

  def total_before_tax
    order_items.inject(0.0) { |t, i| t + i.sub_total }
  end

  def tax
    order_items.inject(0.0) { |t, i| t + i.tax_amount }
  end

  def total_price
    total_before_tax + tax + shipping_cost
  end
  def total_price_in_pence
    (self.total_price*100).to_int
  end

  def shipping_cost
    delivery_service.try(:price) || 0
  end

  def flagged?
    issue_raised? || resolved?
  end

  def locked?
    processing? || complete?
  end

end
