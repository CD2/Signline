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


end
