class CreateEmploymentNotices < ActiveRecord::Migration
  def change
    create_table :employment_notices do |t|
      t.string :businessName
      t.string :businessPhone
      t.string :businessMail
      t.string :businessStreet
      t.string :businessCity
      t.string :businessPostalcode
      t.string :description
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
