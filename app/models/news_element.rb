class NewsElement < ActiveRecord::Base

  belongs_to :newsletter
  belongs_to :newsletterable, polymorphic: true

  belongs_to :category
end
