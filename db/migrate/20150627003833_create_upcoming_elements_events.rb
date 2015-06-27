class CreateUpcomingElementsEvents < ActiveRecord::Migration
  def change
    create_table :upcoming_elements_events do |t|
      t.integer :upcoming_element_id
      t.string :event_id

      t.timestamps null: false
    end
  end
end
