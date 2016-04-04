module PagesHelper

  def page_title title
    title = "#{title} | " if title.present?
    "#{title}#{@site.name}"
  end

end