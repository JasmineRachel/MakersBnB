require 'pg'

class Space

    attr_reader :id, :address, :no_bedrooms

    def initialize(id:, address:, no_bedrooms:)
        @id = id
        @address = address
        @no_bedrooms = no_bedrooms
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'makersbnb_test')
        else
            connection = PG.connect(dbname: 'makersbnb')
        end
        result = connection.exec("SELECT * FROM spaces;")
        result.map { |space| Space.new(id: space['id'], address: space['address'], no_bedrooms: space['no_bedrooms']) }
    end


    def self.add(address:, no_bedrooms:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'makersbnb_test')
        else
            connection = PG.connect(dbname: 'makersbnb')
        end
            connection.exec("INSERT INTO spaces (address, no_bedrooms) VALUES('#{address}', '#{no_bedrooms}') RETURNING address, no_bedrooms;")
    end
    
end


        
