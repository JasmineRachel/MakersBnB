require 'sinatra/base'
require './lib/space.rb'

class MakersBnb < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello World'
  end
  

  get '/add_space' do
    @space = Space.all
    # connection = PG.connect(dbname: 'makersbnb') 
    # connection.exec("SELECT * FROM spaces;")
    erb :'add_space'
  end

  post '/add_space' do
    # @space = Space.add
    # address = params[:address]
    # # no_bedrooms = params[:no_bedrooms]
    # Space.add(address: params[:address], no_bedrooms: params[:no_bedrooms] )
    
    # connection = PG.connect(dbname: 'makersbnb_test')
    # connection.exec("INSERT INTO spaces (address, no_bedrooms) VALUES('#{address}', '#{no_bedrooms}')")
    # redirect :'/listings'
  end 

  # post '/listings' do
  #   @space.each
  # end

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
