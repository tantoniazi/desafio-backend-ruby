require 'rails_helper'

describe StoresController, type: :controller do


    5.times do
        Store.create do |row|
          row.name = Faker::Name.first_name
          row.address = Faker::Address.street_name
        end
      end
      
    it 'stores request index is 200 ok' do
        get :index
        response
        expect(response.status).to eq(200)
    end

    it 'GET SHOW stores/:id' do
        store = Store.order('RANDOM()').first
        get :show, params: {id:store.id}
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('id')).to eq(store.id)
    end


    it 'POST UPDATE stores/:id' do
        store = Store.order('RANDOM()').first
        post :update, params: {id:store.id , store: {name: Faker::Name.first_name, address: Faker::Address.street_name } }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('id')).to eq(store.id)
        expect(response.status).to eq(200)
    end

    it 'POST DESTROY stores/:id' do
        store = Store.order('RANDOM()').first
        post :destroy, params: {id:store.id}
        expect(response.status).to eq(204)
    end

    it 'POST CREATE products' do
        post :create, params: { store: {name: Faker::Name.first_name, address: Faker::Address.street_name } }
        response_body = JSON.parse(response.body)
        expect(response.status).to eq(201)
    end


end

