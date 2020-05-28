require 'sinatra/base'
require './lib/user.rb'

class MakersBnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
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
