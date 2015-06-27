class AddCategoryIdToNewsElement < ActiveRecord::Migration
  def change
    add_column :news_elements, :category_id, :integer
  end
end
