require 'pg'

task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE makersbnb;')

  connection = PG.connect :dbname => 'makersbnb';
  connection.exec('CREATE TABLE users (user_id SERIAL PRIMARY KEY, first_name VARCHAR(60), last_name VARCHAR(60), email VARCHAR(60), password VARCHAR(20));')
  connection.exec('CREATE TABLE spaces (id SERIAL PRIMARY KEY, address VARCHAR(60), No_bedrooms SMALLINT, user_id INT REFERENCES users(user_id));')

  connection.exec('CREATE DATABASE makersbnb_test;')

  connection = PG.connect :dbname => 'makersbnb_test';
  connection.exec('CREATE TABLE users (user_id SERIAL PRIMARY KEY, first_name VARCHAR(60), last_name VARCHAR(60), email VARCHAR(60), password VARCHAR(20));')
  connection.exec('CREATE TABLE spaces (id SERIAL PRIMARY KEY, address VARCHAR(60), No_bedrooms SMALLINT, user_id INT REFERENCES users(user_id));')
end
