class StockItem < ApplicationRecord
  belongs_to :product
  belongs_to :store
end
