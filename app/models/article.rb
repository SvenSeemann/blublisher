class Article < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  has_one :news_element, as: :newsletterable
end
