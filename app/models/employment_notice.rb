class EmploymentNotice < ActiveRecord::Base

  belongs_to :department

  has_many :job_wall_element_employment_notices
  has_many :job_wall_elements, through: :job_wall_element_employment_notices
end
