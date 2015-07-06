# == Schema Information
#
# Table name: job_wall_elements
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JobWallElement < ActiveRecord::Base
  has_one :news_element, as: :newsletterable

  has_many :job_wall_element_employment_notices
  has_many :employment_notices, through: :job_wall_element_employment_notices
end
