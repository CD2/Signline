module ApplicationHelper

  def body_classes
    [
      "#{'front' if current_page?(root_path)}",
      "#{'not_front' unless current_page?(root_path)}",
      "#{'default_site' if @site.default? }", 
      "#{'admin_section' if admin_section?}",
      "#{'logged_in' if signed_in?}",
      "#{'admin_user' if signed_in_as_admin?}",
      "#{'admin_box_active' if session[:admin_visible]}"
    ]    
  end

  def admin_section?
    controller.class.name.split("::").include? "Admin"
  end

  def shop_site?
    @site.subdomain == 'shop'
  end

  def errors obj, f
    if obj.errors.any?
      render 'layouts/errors', object: f.object
    end
  end

  def link_to_add_fields(name, f, association, cssClass, title)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to name, "javascript:void(0)", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => cssClass, :title => title
  end

end
