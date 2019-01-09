ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './config/data_mapper'
class Makersbnb < Sinatra::Base

  get '/' do 
    erb (:index)
  end







end 