# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  starts_at   :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#

class Event < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar

  has_many :upcoming_elements_events
  has_many :upcoming_events, through: :upcoming_elements_events
end
