require 'rails_helper'

describe StockitemsController, type: :controller do

    it 'GET stores/:store_id/stockitems' do
        store = Store.order('RANDOM()').first
        get :index, params: { :store_id=> store.id }
        expect(response.status).to eq(200)
    end


    30.times do
        it 'POST CREATE stores/:store_id/stockitems' do
            store = Store.order('RANDOM()').first
            product = Product.order('RANDOM()').first
            post :create, params: {:store_id => store.id ,  stockitem: {product_id: product.id  , store_id: store.id , stock_value: Faker::Number.number(digits:5)} }
            response_body = JSON.parse(response.body)
            expect(response.status).to eq(201)
        end
    end

    it 'GET SHOW stores/:store_id/stockitems/:id' do
        store = Store.order('RANDOM()').first
        stockitem = Stockitem.order('RANDOM()').first
        get :show, :store_id => store.id , :id => stockitem.id
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('store_id')).to eq(store.id)
        expect(response_body.fetch('id')).to eq(stockitem.id)
    end


    it 'POST UPDATE stores/:store_id/stockitems/:id' do
        store = Store.order('RANDOM()').first
        stockitem = Stockitem.order('RANDOM()').first
        get :update, :store_id =>  store.id , :id => stockitem.id ,  params: { stockitem: {product_id: product.id  , store_id: store.id , stock_value: Faker::Number.number(digits:5)} }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('id')).to eq(product.id)
        expect(response.status).to eq(200)
    end

    it 'POST DESTROY stores/:store_id/stockitems/:id' do
        store = Store.order('RANDOM()').first
        stockitem = Stockitem.order('RANDOM()').first
        post :destroy, :store_id => store.id , :id => stockitem.id
        expect(response.status).to eq(204)
    end


    
end

