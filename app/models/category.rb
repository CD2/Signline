class Category < ActiveRecord::Base
  validates :machine_name, presence: true, uniqueness: true

  has_many :categorisations, dependent: :destroy
  has_many :products, through: :categorisations

  has_many :site_categories
  has_many :sites, through: :site_categories

  def assigned_to_site? site
    sites.include? site
  end

  def assign_to_site site
    site_categories.create(site_id: site.id)
  end

  def unassign_to_site site
    site_categories.find_by(site_id: site.id).destroy
  end
end
