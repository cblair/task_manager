class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :req_desc
      t.integer :specification_id

      t.timestamps
    end
  end
end
