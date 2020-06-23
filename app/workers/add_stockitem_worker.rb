class AddStockitemWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(params)
    stockitem = Stockitem.where('product_id = ?  and store_id = ?' , params[:product_id] , params[:stock_id]).first()
    stockitem.stock_value += params[:stock_value]
    stockitem.save()
  end
 end

end
