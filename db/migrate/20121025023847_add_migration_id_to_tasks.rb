class AddMigrationIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :migration_id, :integer

  end
end
