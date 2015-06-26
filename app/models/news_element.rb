class NewsElement < ActiveRecord::Base

  belongs_to :newsletter
  belongs_to :newsletterable, polymorphic: true
end