class JobWallElementEmploymentNotice < ActiveRecord::Base

  belongs_to :job_wall_element
  belongs_to :employment_notice
end
