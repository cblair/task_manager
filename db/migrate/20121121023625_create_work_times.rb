class CreateWorkTimes < ActiveRecord::Migration
  def change
    create_table :work_times do |t|
      t.datetime :start_time
      t.datetime :endtime
      t.integer :task_id

      t.timestamps
    end
  end
end
