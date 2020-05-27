require 'sinatra/base'
require './lib/user.rb'

class MakersBnb < Sinatra::Base
  enable :sessions
  
  get '/' do
    @user = User.find(session[:user_id])
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
    redirect '/'
  end

  get '/login' do
    erb :login
  end



  run! if app_file == $0
end
