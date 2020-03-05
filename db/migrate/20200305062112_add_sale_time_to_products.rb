class AddSaleTimeToProducts < ActiveRecord::Migration[5.2]
  def self.up
    add_column :products, :sale_time, :datetime
  end

  def self.down
    remove_column :products, :sale_time, :datetime
  end
end
