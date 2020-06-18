class CreateStockitems < ActiveRecord::Migration[6.0]
  def change
    create_table :stockitems do |t|
      t.integer :product_id
      t.integer :store_id
      t.integer :stock_value

      t.timestamps
    end
  end
end
