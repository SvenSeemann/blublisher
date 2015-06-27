class CreateUpcomingElements < ActiveRecord::Migration
  def change
    create_table :upcoming_elements do |t|

      t.timestamps null: false
    end
  end
end
