require 'rails_helper'

describe ProductsController, type: :controller do 
    it 'GET INDEX is 200 ok' do
        get :index
        response
        expect(response.status).to eq(200)
    end

    it 'GET SHOW products/:id' do
        product = Product.order('RANDOM()').first
        get :show, params: {id:product.id}
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('id')).to eq(product.id)
    end


    it 'POST UPDATE products/:id' do
        product = Product.order('RANDOM()').first
        get :update, params: {id:product.id , product: {name: Faker::Name.name , price: Faker::Number.number(digits:5) } }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('id')).to eq(product.id)
        expect(response.status).to eq(200)
    end

    it 'POST DESTROY products/:id' do
        product = Product.order('RANDOM()').first
        post :destroy, params: {id:product.id}
        expect(response.status).to eq(204)
    end

    it 'POST CREATE products' do
        post :create, params: { product: {name: Faker::Name.name , price: Faker::Number.number(digits:5) } }
        response_body = JSON.parse(response.body)
        expect(response.status).to eq(201)
    end

end

