module AprerPagesHelper
  def page_title(title)
    base_title = "APRER"
    if(title.empty?)
      base_title
    else
      "#{title} - #{base_title}"
    end
  end
end
