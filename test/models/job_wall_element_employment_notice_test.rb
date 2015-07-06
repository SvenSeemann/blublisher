# == Schema Information
#
# Table name: job_wall_element_employment_notices
#
#  id                   :integer          not null, primary key
#  employment_notice_id :integer
#  job_wall_element_id  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class JobWallElementEmploymentNoticeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
