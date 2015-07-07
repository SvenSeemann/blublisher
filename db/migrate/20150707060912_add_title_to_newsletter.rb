class AddTitleToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :title, :string
  end
end
