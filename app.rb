ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
class Makersbnb < Sinatra::Base

  enable :sessions

  get '/' do 
    erb (:index)
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