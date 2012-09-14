class CreateTaskCategories < ActiveRecord::Migration
  def change
    create_table :task_categories do |t|
      t.string :name
      t.integer :task_category_id

      t.timestamps
    end
  end
end
