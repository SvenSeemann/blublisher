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

class EmploymentNotice < ActiveRecord::Base

  belongs_to :department

  has_many :job_wall_element_employment_notices
  has_many :job_wall_elements, through: :job_wall_element_employment_notices
end
