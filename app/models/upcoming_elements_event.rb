class UpcomingElementsEvent < ActiveRecord::Base
  belongs_to :upcoming_element
  belongs_to :event
end
