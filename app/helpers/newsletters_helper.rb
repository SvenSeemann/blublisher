module NewslettersHelper

  def find_partial_new(element_type)
    case(element_type)
    when 'Article'
      return 'newsletters/elements/article_form'
    when 'Upcoming'
      return 'newsletters/elements/upcoming_form'
    when 'EmploymentNotice'
      return 'newsletters/elements/job_wall_form'
    end
  end

  def find_partial_show(element_type)
    case(element_type)
    when 'Article'
      return 'newsletters/elements/article'
    when 'Upcoming'
      return 'newsletters/elements/upcoming'
    when 'EmploymentNotice'
      return 'newsletters/elements/job_wall'
    end
  end

  def find_partial_mail(element_type)
    case(element_type)
    when 'Article'
      return 'newsletters/elements/mail/article'
    when 'Upcoming'
      return 'newsletters/elements/mail/upcoming'
    when 'EmploymentNotice'
      return 'newsletters/elements/mail/job_wall'
    end
  end

end
