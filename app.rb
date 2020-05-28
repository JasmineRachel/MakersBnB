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
    erb :add_space
  end

  post '/spaces/new' do
    @address = params[:address]
    @no_bedromms = params[:no_bedromms]
    Space.add(address: @address, no_bedromms: @no_bedromms)
    redirect :'/spaces'
  end

  post '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  run! if app_file == $0
end
