# == Schema Information
#
# Table name: upcoming_elements_events
#
#  id                  :integer          not null, primary key
#  upcoming_element_id :integer
#  event_id            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class UpcomingElementsEvent < ActiveRecord::Base
  belongs_to :upcoming_element
  belongs_to :event
end
