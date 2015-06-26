class Slider < ActiveRecord::Base

  has_one :news_element, as: :newsletterable
end
