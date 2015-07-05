class CreateEmploymentNotices < ActiveRecord::Migration
  def change
    create_table :employment_notices do |t|
      t.string :business_name
      t.string :business_phone
      t.string :business_mail
      t.string :business_street
      t.string :business_city
      t.string :business_postalcode
      t.string :description
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
