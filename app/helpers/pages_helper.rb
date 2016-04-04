module PagesHelper

  def page_title title
    title = "#{title} | " if title
    "#{title}#{@site.name}"
  end

end