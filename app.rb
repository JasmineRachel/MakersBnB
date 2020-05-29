require 'sinatra/base'
require './lib/space.rb'
require 'pg'
require './lib/user.rb'

class MakersBnb < Sinatra::Base
  enable :sessions

  get '/' do
    @user = session[:user]
    erb :index
  end

  get '/sessions/new' do
    @log_in_status = session[:user]
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user] = user
    user == 'Unsuccessful' ? redirect('/sessions/new') : redirect('/')
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

  get '/spaces' do
    @spaces = Space.all
    p @spaces
    erb :spaces
  end

  get '/spaces/new' do
    erb :add_space
  end

  post '/spaces' do
    Space.add(name: params[:name], address: params[:address], description: params[:description], no_bedrooms: params[:no_bedrooms], price_per_night: params[:price_per_night])
    p params[:name]
    redirect :'/spaces'
  end

  run! if app_file == $0
end
