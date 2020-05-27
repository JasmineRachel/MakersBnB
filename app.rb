require 'sinatra/base'

class MakersBnb < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/add_space' do
    erb :'add_space'
  end

  post '/add_space' do
    erb :'add_space'
    redirect :'index'
  end
  

  post 

  run! if app_file == $0
end
