module NewslettersHelper

  def find_partial_new(element_type)
    case(element_type)
    when 'Article'
      return 'newsletters/elements/article_form'
    when 'Upcoming'
      return 'newsletters/elements/upcoming_form'
    when 'Slider'
      return 'newsletters/elements/slider_form'
    end
  end

  def find_partial_show(element_type)
    case(element_type)
    when 'Article'
      return 'newsletters/elements/article'
    when 'Upcoming'
      return 'newsletters/elements/upcoming'
    when 'Slider'
      return 'newsletters/elements/slider'
    end
  end

end
