module PagesHelper

  def page_title title
    if title.blank?
      @site.name
    else
      "#{title} | #{@site.name}"
    end
  end

end