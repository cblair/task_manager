class AddCategoryIdToSpecifications < ActiveRecord::Migration
  def change
    add_column :specifications, :category_id, :integer

  end
end
