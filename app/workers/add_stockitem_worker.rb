class AddStockitemWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id,value)
    stockitem = Stockitem.find(id)
    stockitem.add_stock(value)
  end
 end
