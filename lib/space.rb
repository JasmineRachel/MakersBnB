require 'pg'

class Space

    # def initialize(address:, no_bedrooms:)
    #     @address = address
    #     @no_bedrooms = no_bedrooms
    # end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'makersbnb_test')
        else
            connection = PG.connect(dbname: 'makersbnb')
        end
        result = connection.exec("SELECT * FROM spaces;")
        result.map { |spaces| spaces['address'] }
    end


    # def self.add(address:, no_bedrooms:)
    #     if ENV['ENVIRONMENT'] == 'test'
    #         connection = PG.connect(dbname: 'makersbnb_test')
    #     else
    #         connection = PG.connect(dbname: 'makersbnb')
    #     end
    #         connection.exec("INSERT INTO spaces (address, no_bedrooms) VALUES('#{address}', '#{no_bedrooms}') RETURNING address, no_bedrooms;")
    # end

    def self.add
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'makersbnb_test')
        else
            connection = PG.connect(dbname: 'makersbnb')
        end
            connection.exec("SELECT * FROM spaces;")
    end
end


        
