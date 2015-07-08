class ChangeDescriptionInEmploymentNotices < ActiveRecord::Migration
  def up
    change_column :employment_notices, :description, :text
  end

  def down
    change_column :employment_notices, :description, :string
  end
end
