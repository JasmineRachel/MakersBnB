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

  # describe '.find' do
  #   it 'returns the requested user object' do
  #     user = User.create(first_name: 'Jon', last_name: 'Filar', email: 'jon@hotmail.com', password: 'hello123')
  #
  #     result = User.find(id: user.id)
  #
  #     expect(result).to be_a User
  #     expect(result.id).to eq user.id
  #     expect(result.first_name).to eq 'Jon'
  #     expect(result.email).to eq 'jon@hotmail.com'
  #   end
  # end

  describe '.authenticate' do
    it 'authenticates a user' do
      user = User.create(first_name: 'Test' , last_name: 'Testerson' ,email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email:'test@example.com',password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
    it 'returns nil given an incorrect email address' do
      User.create(first_name: 'Test' , last_name: 'Testerson' ,email: 'test@example.com', password: 'password123')
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to eq 'Unsuccessful'
    end
  end
end
