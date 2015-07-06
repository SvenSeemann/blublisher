# == Schema Information
#
# Table name: news_elements
#
#  id                  :integer          not null, primary key
#  newsletterable_type :string
#  newsletterable_id   :integer
#  newsletter_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#

class NewsElement < ActiveRecord::Base

  belongs_to :newsletter
  belongs_to :newsletterable, polymorphic: true

  belongs_to :category
end
