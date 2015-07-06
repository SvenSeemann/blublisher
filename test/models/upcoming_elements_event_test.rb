# == Schema Information
#
# Table name: upcoming_elements_events
#
#  id                  :integer          not null, primary key
#  upcoming_element_id :integer
#  event_id            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class UpcomingElementsEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
