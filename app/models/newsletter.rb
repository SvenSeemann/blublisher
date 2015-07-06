# == Schema Information
#
# Table name: newsletters
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Newsletter < ActiveRecord::Base

  has_many :news_elements
end
