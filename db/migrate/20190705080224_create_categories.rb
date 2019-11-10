class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :icon
      t.integer :tag
      t.integer :parent_id
      t.boolean :published
      t.string :slug

      t.timestamps
    end
  end
end
