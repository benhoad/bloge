module PostsHelper
  def text_to_html (text)
    Moredown.text_to_html(text).html_safe
  end
end
