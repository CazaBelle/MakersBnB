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

  get '/sign-in' do 
    erb (:sign_in)
  end

  post '/sign-in' do
    user = User.authenticate(params[:email], params[:password])
      if user 
        sessions[:user_id] = user.id
        redirect('/profile')
      else
        redirect'/error'
      end
  end

  get '/profile' do 
  end

end 

