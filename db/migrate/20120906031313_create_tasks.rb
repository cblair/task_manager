class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :task_desc
      t.time :est_time
      t.time :act_time

      t.timestamps
    end
  end
end
