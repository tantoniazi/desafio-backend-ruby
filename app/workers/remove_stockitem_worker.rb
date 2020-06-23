class RemoveEndangeredWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform

    stockitem = Stockitem.where('product_id = ?  and store_id = ?' , params[:product_id] , params[:stock_id]).first()
    if()
    stockitem.stock_value -= params[:stock_value]
    stockitem.save()

  end

end