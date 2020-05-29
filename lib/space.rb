require 'pg'

class Space

    attr_reader :id, :name, :address, :description, :no_bedrooms, :price_per_night

    def initialize(id:, name:, address:, description:, no_bedrooms:, price_per_night:)
        @id = id
        @name = name
        @address = address
        @description = description 
        @no_bedrooms = no_bedrooms
        @price_per_night = price_per_night
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'makersbnb_test')
        else
            connection = PG.connect(dbname: 'makersbnb')
        end
        result = connection.exec("SELECT * FROM spaces;")
        result.map { |space| Space.new(id: space['id'], name: space['name'], address: space['address'], description: space['description'], no_bedrooms: space['no_bedrooms'], price_per_night: space['price_per_night']) }
    end


    def self.add(name:, address:, description:, no_bedrooms:, price_per_night:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'makersbnb_test')
        else
            connection = PG.connect(dbname: 'makersbnb')
        end

        result = connection.exec("INSERT INTO spaces (Name, Address, Description, No_bedrooms, Price_per_Night) VALUES('#{name}', '#{address}', '#{description}', '#{no_bedrooms}', '#{price_per_night}') RETURNING id, name, address, description, no_bedrooms, price_per_night")
        Space.new(id: result[0]['id'], name: result[0]['name'], address: result[0]['address'], description: result[0]['description'], no_bedrooms: result[0]['no_bedrooms'], price_per_night: result[0]['price_per_night'])

    end

end
