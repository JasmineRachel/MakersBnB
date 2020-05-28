require 'pg'

class User
  attr_reader :id, :first_name, :last_name, :email, :password
  def initialize(id:, first_name:, last_name:, email:, password:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def self.create(first_name:, last_name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO users (first_name,last_name,email,password) VALUES('#{first_name}', '#{last_name}', '#{email}', '#{password}') RETURNING user_id, first_name, last_name, email, password")
    User.new(id: result[0]['user_id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], email: result[0]['email'], password: result[0]['password'])
  end

  # def self.find(id:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'makersbnb_test')
  #   else
  #     connection = PG.connect(dbname: 'makersbnb')
  #   end
  #
  #   result = connection.exec("SELECT * FROM users WHERE user_id = #{id}")
  #   User.new(id: result[0]['user_id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], email: result[0]['email'], password: result[0]['password'])
  #
  # end

  def self.authenticate(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}'")
      return unless result.any?
    user = User.new(id: result[0]['user_id'], first_name: result[0]['first_name'], last_name: result[0]['last_name'], email: result[0]['email'], password: result[0]['password'])
  end
end
