class JobWallElement < ActiveRecord::Base
  has_one :news_element, as: :newsletterable

  has_many :job_wall_element_employment_notices
  has_many :employment_notices, through: :job_wall_element_employment_notices
end
