class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :content, limit: 16777215
      t.decimal :price, default: 0, precision: 8, scale: 2
      t.integer :buyer, default: 0
      t.string :data_file
      t.string :manufacturer
      t.references :category, foreign_key: true
      t.boolean :published, default: true
      t.string :tags
      t.string :langugage, default: 'English'
      t.string :slug

      t.timestamps
    end
  end
end
