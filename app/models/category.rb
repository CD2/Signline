class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :categorisations, dependent: :destroy
  has_many :products, through: :categorisations

  has_many :site_categories
  has_many :sites, through: :site_categories

  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id'
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  before_save :create_machine_name

  default_scope -> { order name: :asc }

  def assigned_to_site? site
    sites.include? site
  end

  def assign_to_site site
    site_categories.create(site_id: site.id)
  end

  def unassign_to_site site
    site_categories.find_by(site_id: site.id).destroy
  end

  def create_machine_name
    self.machine_name = self.name.parameterize
  end

  extend FriendlyId
  friendly_id :machine_name


end
