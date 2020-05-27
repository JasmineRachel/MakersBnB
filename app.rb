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
    
  end

  run! if app_file == $0
end
