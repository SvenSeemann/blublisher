# == Schema Information
#
# Table name: news_elements
#
#  id                  :integer          not null, primary key
#  newsletterable_type :string
#  newsletterable_id   :integer
#  newsletter_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#

require 'test_helper'

class NewsElementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
