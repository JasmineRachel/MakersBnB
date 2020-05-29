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
