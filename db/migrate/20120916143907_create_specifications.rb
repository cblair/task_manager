class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :name
      t.text :spec_desc

      t.timestamps
    end
  end
end
