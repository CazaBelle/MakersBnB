ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
class Makersbnb < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect "/signin"
  end

  get "/signin" do

  end


end
