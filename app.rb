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
    # redirect "/error" unless user.valid?
    if user.valid?
      session[:user_id] = user.id
      redirect "/signin"
    else
      redirect "/error"
    end
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

  get "/error" do
    
  end

  get '/profile' do
    erb (:profile)
  end

end
