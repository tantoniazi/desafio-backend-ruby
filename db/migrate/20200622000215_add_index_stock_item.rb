class AddIndexStockItem < ActiveRecord::Migration[6.0]
  def change
    add_index(:stockitems, [:product_id, :store_id], name: 'product-store-index')
  end
end
