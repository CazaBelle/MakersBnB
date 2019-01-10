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
        sessions[:id] = user.id
      else
      end
    redirect('/profile')
  end

end 