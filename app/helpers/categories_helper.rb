module CategoriesHelper

  def print_category_tree branch=nil
    branch ||= Category.get_tree
    html = ''
    branch.each do |category, next_branch|
      html += "<li>#{link_to category.name, category}#{print_category_tree next_branch}</li>"
    end
    html.empty? ? '' : "<ul>#{html}</ul>".html_safe
  end

  def render_breadcrumbs category, tail_link=nil
    render 'breadcrumbs', category: category, tail: tail_link
  end


end
