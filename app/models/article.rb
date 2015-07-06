# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  category_id :integer
#

class Article < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  has_one :news_element, as: :newsletterable
end
