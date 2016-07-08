class Product < ActiveRecord::Base
  include Ebay
  has_many :order_items
  has_many :product_images
  belongs_to :brand
  has_many :categorisations
  has_many :categories, through: :categorisations
  has_many :sites, through: :categories
  
  scope :ordered, lambda {|*args| order(args.first || 'created_at DESC') }

  extend FriendlyId
  friendly_id :machine_name

  validates :sku, presence: true, uniqueness: true

  before_save :set_machine_name

  def self.ebay_categories options={}
    categories = EbayTrader::Request.new('GetCategories') do
      CategorySiteID 3
      DetailLevel 'ReturnAll'
      ViewAllNodes false
    end

    if categories.success?
      @hash = []
      cat = categories.response_hash[:category_array][:category].each do |hash|
        arr = []
        arr << hash[:category_name]
        arr << hash[:category_id]
        @hash << arr
      end
      @hash
    end
  end

  def images
    product_images.collect { |product_image| product_image.image }
  end

  def primary_image
    images.first
  end

  def category= val
    categories << Category.find_by_path(val)
  end

  def images= val
    product_images << (val.map { |image| ProductImage.create(image: image) } )
  end

  def features= val
    super (val.kind_of? Array) ? val *"\n" : val
  end

  def features
    super.split("\n") if super
  end

  def category
    categories.first
  end

  def item_on_ebay?

    e_id = ebay_item_id
    request = EbayTrader::Request.new('GetItem') do
      ItemID e_id
    end
    request.success?
  end

  def add_item_to_ebay

    e_sku = sku
    e_name = name
    e_category = ebay_category
    e_price = unit_price
    e_cond = 1000
    e_duration = 'Days_30'
    e_quantity = 1
    e_returns_accepted = 'ReturnsAccepted'
    e_returns_with = 'Days_30'
    e_returns_paid_by = 'Buyer'
    e_pics = product_images.collect{|i| i.image.url }
    e_body = body
    e_shipping_service = 'UK_OtherCourier3Days'
    e_shipping_cost = delivery
    e_free_shipping = false

    request = EbayTrader::Request.new('AddFixedPriceItem') do

      ErrorLanguage 'en_GB'
      WarningLevel 'High'
      Item do
        Title e_name
        Description 'Description'
        SKU e_sku
        InventoryTrackingMethod 'SKU'
        PrimaryCategory do
          CategoryID e_category
        end
        StartPrice e_price
        CategoryMappingAllowed true
        ConditionID 1000
        Country 'GB'
        PostalCode 'NR15 2DL'
        Location 'Norfolk'
        Currency 'GBP'
        DispatchTimeMax 1
        ListingDuration e_duration
        ListingType 'FixedPriceItem'
        PaymentMethods 'PayPal'
        PayPalEmailAddress 'jason@signsandprinting.co.uk'
        ItemSpecifics do
          NameValueList do
            Name 'MPN'
            Value 'Does not apply'
          end
          NameValueList do
            Name 'Brand'
            Value 'Does not apply'
          end
        end
        PictureDetails do
          GalleryType "Gallery"
          PictureSource "Vendor"
          e_pics.each do |pic|
            PictureURL pic
          end
        end
        PostalCode 'NR15 2DL'
        Quantity e_quantity
        ReturnPolicy do
          ReturnsAcceptedOption e_returns_accepted
          ReturnsWithinOption e_returns_with
          ShippingCostPaidByOption e_returns_paid_by
        end
        ShippingDetails do
          ShippingType 'Flat'
          ShippingServiceOptions do
            ShippingServicePriority 1
            ShippingService e_shipping_service
            FreeShipping e_free_shipping
            ShippingServiceCost e_shipping_cost
            ShippingServiceAdditionalCost e_shipping_cost
          end
        end
        Site 'UK'
      end
    end

  end

  def get_item_info_from_sku
    e_sku = sku
    EbayTrader::Request.new('GetItem') do
      SKU e_sku
    end
  end

  private

  def set_machine_name
    self.machine_name = self.name.parameterize
  end

end
