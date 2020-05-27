require 'Space.rb'

describe Space do
    it 'allow user to input a Space' do
        Space.new
        expect(Space.add('Audley')).to eq('Audley')
    end
end

