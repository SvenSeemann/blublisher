class Newsletter < ActiveRecord::Base

  has_many :news_elements
end
