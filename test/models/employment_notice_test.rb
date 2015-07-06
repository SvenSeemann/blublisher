# == Schema Information
#
# Table name: employment_notices
#
#  id                  :integer          not null, primary key
#  business_name       :string
#  business_phone      :string
#  business_mail       :string
#  business_street     :string
#  business_city       :string
#  business_postalcode :string
#  description         :string
#  department_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  title               :string
#

require 'test_helper'

class EmploymentNoticeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
