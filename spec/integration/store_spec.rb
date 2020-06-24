require 'swagger_helper'

describe 'stores api' do
  path '/stores' do
    post 'post stores' do
      tags 'stores'
      consumes 'application/json', 'application/xml'
      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string }
        },
        required: [ 'name', 'address' ]
      }
      response '201', 'store created' do
        let(:store) { { name:  Faker::Name.first_name, address: Faker::Address.street_name } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:store) { { name: Faker::Name.first_name } }
        run_test!
      end
    end
  end
  path '/stores/{id}' do
    get 'get stores' do
      tags 'stores'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :integer
      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
        },
        required: [ 'name', 'address' ]
      }

      response '200', 'store found' do
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
      response '404', 'store not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
    post 'update stores' do
        put 'get stores' do
            tags 'stores'
            consumes 'application/json', 'application/xml'
            produces 'application/json'
            parameter name: :id, :in => :path, :type => :integer
            parameter name: :store, in: :body, schema: {
                type: :object,
                properties: {
                name: { type: :string },
                address: { type: :string }
                },
                required: [ 'name', 'address' ]
            }
            response '200', 'store found' do
                schema type: :object,
                properties: {
                    id: { type: :integer, },
                    name: { type: :string },
                    address: { type: :string }
                },
                required: [ 'id', 'name', 'address' ]

                let(:id) { Store.update(name: Faker::Name.first_name, address: Faker::Address.street_name).id }
                run_test!
            end
            response '404', 'store not found' do
                let(:id) { 'invalid' }
                run_test!
            end
            end
        end
    end
end