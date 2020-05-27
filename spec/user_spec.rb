require 'user'

RSpec.describe User do
  describe '.create' do
    it 'can add a user to the database' do
      connection = PG.connect(dbname: 'makersbnb_test')

      User.create(first_name: 'Jon', last_name: 'Filar', email: 'jon@hotmail.com', password: 'hello123')

      users = connection.exec("SELECT * FROM users")
      expect(users.first['first_name']).to eq 'Jon'
      expect(users.first['email']).to eq 'jon@hotmail.com'

    end
  end
end
