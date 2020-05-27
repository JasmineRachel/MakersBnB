require 'pg'

class User
  def initialize(id:, first_name:, last_name:, email:, password:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def create(first_name:, last_name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO users (first_name,last_name,email,password) VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}') RETURNING id, first_name, last_name, email, password")
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], last_name: (result[0]['last_name'], email: (result[0]['email'], password: (result[0]['password]))
  end
end