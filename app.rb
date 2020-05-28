require 'sinatra/base'
require './lib/space.rb'

class MakersBnb < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    @space = Space.all
    erb :'add_space'
  end

  post '/spaces' do
    redirect :'index'
  end

  run! if app_file == $0
end
