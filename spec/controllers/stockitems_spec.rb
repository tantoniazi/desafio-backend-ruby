require 'rails_helper'

describe StockitemsController, type: :controller do


    15.times do
        store = Store.order('RANDOM()').first
        product = Product.order('RANDOM()').first
        Stockitem.create do |row|
          row.product_id = product.id,
          row.store_id = store.id,
          row.stock_value = Faker::Number.number(digits:5)
        end
    end
    
    it 'GET stockitems' do
        get :index
        expect(response.status).to eq(200)
    end


    30.times do
        it 'POST CREATE stockitems' do
            store = Store.order('RANDOM()').first
            product = Product.order('RANDOM()').first
            post :create, params: { stockitem: {product_id: product.id  , store_id: store.id , stock_value: Faker::Number.number(digits:5)} }
            response_body = JSON.parse(response.body)
            expect(response.status).to eq(201)
        end
    end

    it 'GET SHOW stockitems/:id' do
        stockitem = Stockitem.order('RANDOM()').first
        get :show, params: {id:stockitem.id} 
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('id')).to eq(stockitem.id)
    end


    it 'POST UPDATE stockitems/:id' do
        store = Store.order('RANDOM()').first
        stockitem = Stockitem.order('RANDOM()').first
        post :update, params: {id:stockitem.id ,  stockitem: {product_id: product.id  , store_id: store.id , stock_value: Faker::Number.number(digits:5)} }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('id')).to eq(stockitem.id)
        expect(response.status).to eq(200)
    end

    it 'POST DESTROY stockitems/:id' do
        stockitem = Stockitem.order('RANDOM()').first
        post :destroy, stockitem.id 
        expect(response.status).to eq(204)
    end


    
end

