require 'Space.rb'

describe Space do
    it 'allow user to input a Space' do

        space = Space.add(name: 'Chan', address: 'Audley', description: 'house', no_bedrooms: '3', price_per_night: 100)
        
        expect(space.address).to eq("Audley")
        expect(space.no_bedrooms).to eq("3")

    end
end
