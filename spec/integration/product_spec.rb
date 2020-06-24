require 'swagger_helper'

describe 'product api' do
  path '/products' do
    post 'post products' do
      tags 'products'
      consumes 'application/json'
      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
        },
        required: [ 'name', 'address' ]
      }

      response '201', 'products created' do
        let(:store) { { name:  Faker::Name.first_name, address: Faker::Address.street_name } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:store) { { name: Faker::Name.first_name } }
        run_test!
      end
    end
  end
  path '/products/{id}' do
    get 'get products' do
      tags 'products'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      response '200', 'products found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            address: { type: :string }
          },
          required: [ 'id', 'name', 'address' ]

        let(:id) { Store.create(name: Faker::Name.first_name, address: Faker::Address.street_name).id }
        run_test!
      end
      response '404', 'products not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end