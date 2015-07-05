class Department < ActiveRecord::Base

  has_many :employment_notices
end
