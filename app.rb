require 'sinatra/base'
require './lib/user.rb'
require 'pg'

class MakersBnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    result = connection.exec("SELECT * FROM users WHERE email = '#{params[:email]}'")
    user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])

    session[:user_id] = user.id
    redirect('/bookmarks')
  end

  get '/users/new' do
    erb :signup
  end

  post '/users/new' do
    User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    @first_name = params[:first_name]
    session[:message] = "Welcome #{@first_name}, you have now registered for Makers BnB!"
    redirect '/success'
  end

  get '/success' do
    @message = session[:message]
    erb :success
  end

  run! if app_file == $0
end
