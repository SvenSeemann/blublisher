class AddTitleToEmploymentNotice < ActiveRecord::Migration
  def change
    add_column :employment_notices, :title, :string
  end
end
