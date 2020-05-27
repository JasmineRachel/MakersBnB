require 'sinatra/base'

class MakersBnb < Sinatra::Base
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
    redirect '/success'
  end

  get '/success' do
    erb :success
    # @user_name = @user.first_name
  end

  run! if app_file == $0
end
