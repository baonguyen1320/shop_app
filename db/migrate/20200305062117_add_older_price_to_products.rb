class AddOlderPriceToProducts < ActiveRecord::Migration[5.2]
  def self.up
    add_column :products, :older_price, :decimal, default: 0, precision: 8, scale: 2
  end

  def self.down
    remove_column :products, :older_price, :decimal
  end
end
