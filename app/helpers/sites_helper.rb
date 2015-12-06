module SitesHelper

  def current_site? site
    if site = Site.find_by(url: request.protocol + request.host_with_port).try(:machine_name)
      return true
    end
  end

  def save_ip
    session[:user_ip] = request.remote_ip
  end

  def current_ip
    @ip = session[:user_ip] || save_ip
  end

  def current_site
    @site = Url.find_by(url: request.protocol + request.host_with_port).site
  rescue NoMethodError
    return default_site
  end

  def default_site
    return Site.find_by(default_site: true)
  end

  def active_sites
    @sites = Site.where(active: true).includes(:urls).where.not(urls: { site_id: nil })
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

  def site_products
    @products = current_site.products
  end

  def home_page
    @page = current_site.home_page
  end


end