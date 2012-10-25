class RemoveMigrationIdFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :migration_id
      end

  def down
    add_column :tasks, :migration_id, :integer
  end
end
