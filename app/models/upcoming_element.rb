# == Schema Information
#
# Table name: upcoming_elements
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UpcomingElement < ActiveRecord::Base
  has_one :news_element, as: :newsletterable

  has_many :upcoming_elements_events
  has_many :events, through: :upcoming_elements_events
end
