require 'sinatra/base'
require './lib/user.rb'
require 'pg'

class MakersBnb < Sinatra::Base
  enable :sessions

  get '/' do
    @user = session[:user]
    erb :index
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user] = user
    redirect('/')
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
