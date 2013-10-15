module ApplicationHelper
  def textBlue(text)
    "<p style=\"color:blue\">#{text}</p>".html_safe
  end

  def page_title
    if @page_title then @page_title
    else 'default_title_name'
    end
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path){ content_tag(:span, text) }
  end

end
