class AddTaskCategoryIdToSpecifications < ActiveRecord::Migration
  def change
    add_column :specifications, :task_category_id, :integer

  end
end
