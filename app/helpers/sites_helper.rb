module SitesHelper

  def current_site
    @site = Site.find_by(url: request.original_url[0..-2]) || Site.default
  end

  def render_navigation_menu
    @nav_menu_items = MenuItem.where(menu_type: 3)
    @render_nav_menu = @nav_menu_items.collect { |i| "<li>#{link_to i.name, i.path}</li>" }.join().html_safe
  end

  def site_categories
    @site_categories = current_site.categories 
  end

  def second_sidebar
    current_site.second_sidebar != nil
  end


end