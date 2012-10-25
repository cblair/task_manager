class FixDueDate < ActiveRecord::Migration
  def change
    rename_column :milestones, :due_data, :due_date
  end

  def up
  end

  def down
  end
end
