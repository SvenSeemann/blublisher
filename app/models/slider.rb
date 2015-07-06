# == Schema Information
#
# Table name: sliders
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Slider < ActiveRecord::Base

  has_one :news_element, as: :newsletterable
end
