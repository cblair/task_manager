class CreateTasks < ActiveRecord::Migration
  def change
    #drop_table :tasks
    create_table :tasks do |t|
      t.string :name
      t.string :task_desc
      t.integer :est_hour
      t.integer :est_minute
      t.integer :act_hour
      t.integer :act_minute
      t.integer :priority

      t.timestamps
    end
  end
end
