namespace :db do
    desc "Erase and fill database"
      task :populate => :environment do 
      require 'faker'
      
      15.times do
        Product.create do |row|
          row.name = Faker::Name.name
          row.price = Faker::Number.number(digits:5)
        end
      end

      5.times do
        Store.create do |row|
          row.name = Faker::Name.first_name
          row.address = Faker::Address.street_name
        end
      end

    end
  end