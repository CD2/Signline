class CategoryError < StandardError; end
class Category < ActiveRecord::Base

  has_many :categorisations
  has_many :sites, through: :site_categories
  has_many :site_categories
  has_many :products, through: :categorisations

  belongs_to :parent, class_name: "Category", foreign_key: 'parent_id'
  has_many :children, class_name: "Category", foreign_key: 'parent_id', dependent: :destroy

  before_save :set_url_alias

  scope :populated, -> { joins(:products).group("categories.id").having("count(products.id)>0") }

  validates :name, presence: true

  extend FriendlyId
  friendly_id :url_alias

  def set_url_alias
    self.url_alias = name.parameterize
  end

  def has_products
    products.count > 0 || children.count > 0
  end 

  def breadcrumbs a=nil
    breadcrumbs = []
    cur = self
    while (cur)
      breadcrumbs << (a.present? ? cur.send(a) : cur)
      cur = cur.parent
    end
    breadcrumbs.reverse
  end

  def self.find_by_path val
    bc = val.split('/')
    len = bc.count
    cats = Category.where(name: bc.last)
    cats = cats.select { |cat| cat.breadcrumbs(:name).last(len) == bc}
    raise CategoryError.new('Category not found') if cats.empty?
    raise CategoryError.new('Category Path is ambiguous') if cats.count > 1
    return cats.first
  end

  def self.get_tree parent_id=nil, branch=nil
    branch = {}
    where(parent_id: parent_id).order('name').each do |cat|
      branch[cat] = Category.get_tree cat.id
    end
    return branch
  end

end
