class NewsletterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.current_newsletter.subject
  #
  def current_newsletter
    @newsletter = Newsletter.last

    mail to: "to@example.org"
    render layout: 'mailer'
  end
end
