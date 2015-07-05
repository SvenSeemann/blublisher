class CreateJobWallElements < ActiveRecord::Migration
  def change
    create_table :job_wall_elements do |t|

      t.timestamps null: false
    end
  end
end
