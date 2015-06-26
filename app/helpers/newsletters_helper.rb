module NewslettersHelper

  def find_partial(element_type)
    case(element_type)
    when 'article'
      return 'newsletters/elements/article_form'
    when 'slider'
      return 'newsletters/elements/slider_form'
    end
  end
end
