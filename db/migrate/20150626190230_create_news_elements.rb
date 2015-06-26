class CreateNewsElements < ActiveRecord::Migration
  def change
    create_table :news_elements do |t|
      t.string :newsletterable_type
      t.integer :newsletterable_id
      t.integer :newsletter_id

      t.timestamps null: false
    end
  end
end
