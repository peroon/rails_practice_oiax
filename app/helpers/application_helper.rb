module ApplicationHelper
  def textBlue(text)
    "<p style=\"color:blue\">#{text}</p>".html_safe
  end

  def page_title
    if @page_title then @page_title
    else 'default_title_name'
    end
  end

end
