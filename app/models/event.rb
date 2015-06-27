class Event < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar

  has_many :upcoming_elements_events
  has_many :upcoming_events, through: :upcoming_elements_events
end
