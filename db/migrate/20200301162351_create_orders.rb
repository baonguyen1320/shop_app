class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :order_number
      t.decimal :total, default: 0, precision: 8, scale: 2
      t.string :payment_type
      t.string :status
      t.decimal :shipping_fee, default: 0, precision: 8, scale: 2
      t.decimal :tax_fee, default: 0, precision: 8, scale: 2
      t.string :token_key

      t.timestamps
    end
  end
end
