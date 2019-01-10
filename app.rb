ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'


class Makersbnb < Sinatra::Base


  enable :sessions

  get '/' do 
    erb (:index)
  end
  
   get '/signup' do
    erb(:signup)
  end
  
  post '/signup' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect "/signin"
  end

  get '/signin' do 
    erb (:sign_in)
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
      if user 
        session[:user_id] = user.id
        redirect('/profile')
      else
        redirect'/error'
      end
  end

  get '/profile' do 

  end

  get '/listspace' do
    erb (:list_space)
  end

  post '/listspace' do
    space = Space.create(name: params[:name], description: params[:description], price: params[:price])
    session[:space_id] = space.id
    redirect '/profile'
  end
end 

