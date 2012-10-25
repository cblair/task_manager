class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :milestone_desc
      t.datetime :due_data

      t.timestamps
    end
  end
end
