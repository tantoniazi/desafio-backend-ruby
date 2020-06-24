class Stockitem < ApplicationRecord
  belongs_to :product
  belongs_to :store


  def self.add_stock(value)
    self.stock_value += value
    self.save
  end
end
