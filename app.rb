require 'sinatra/base'
require './lib/space.rb'
require 'pg'

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
    erb :add_space
  end

  post '/spaces' do
    Space.add(address: params[:address], no_bedrooms: params[:no_bedrooms])
    redirect :'/spaces'
  end

  run! if app_file == $0
end
