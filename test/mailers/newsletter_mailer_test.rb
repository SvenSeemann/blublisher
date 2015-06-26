require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "current_newsletter" do
    mail = NewsletterMailer.current_newsletter
    assert_equal "Current newsletter", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
