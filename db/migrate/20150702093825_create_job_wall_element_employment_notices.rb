class CreateJobWallElementEmploymentNotices < ActiveRecord::Migration
  def change
    create_table :job_wall_element_employment_notices do |t|
      t.integer :employment_notice_id
      t.integer :job_wall_element_id

      t.timestamps null: false
    end
  end
end
