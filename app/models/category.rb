class Category < ActiveRecord::Base

  has_many :categorisations
  has_many :sites, through: :site_categories
  has_many :site_categories
  has_many :products, through: :categorisations

  belongs_to :parent, class_name: "Category", foreign_key: 'parent_id'
  has_many :children, class_name: "Category", foreign_key: 'parent_id'

  before_save :set_url_alias

  validates :name, presence: true

  extend FriendlyId
  friendly_id :url_alias

  def set_url_alias
    self.url_alias = name.parameterize
  end

  def breadcrumbs
    breadcrumbs = []
    cur = self
    while (cur)
      breadcrumbs << cur.name
      cur = cur.parent
    end
    breadcrumbs.reverse
  end

end
