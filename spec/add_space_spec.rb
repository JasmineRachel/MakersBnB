require 'Space.rb'

describe Space do
    it 'allow user to input a Space' do

        space = Space.add(address: 'Audley', no_bedrooms: '3')
        
        expect(space.address).to eq("Audley")
        expect(space.no_bedrooms).to eq("3")

    end
end
