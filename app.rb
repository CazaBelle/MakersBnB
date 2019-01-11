ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
require 'pry'

class Makersbnb < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    # redirect "/error" unless user.valid?
    if user.valid?
      session[:id] = user.id
      redirect "/signin"
    else
      redirect "/error"
    end
  end

  get '/signin' do
    erb(:sign_in)
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect("/profile/#{session[:id]}")
    else
      redirect '/error'
    end
  end

  get '/profile/:id' do
    @user = User.get(params[:id])
    @spaces = Space.all(:conditions => { :user_id => params[:id] })
    erb :profile
  end

  get '/profile/listspace/:id' do
    @user = User.get(params[:id])
    erb :list_space
  end

  post '/profile/listspace/:id' do
    @user = User.get(params[:id])
    space = Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: params[:id])
    # session[:space_id] = space.id
    redirect "/profile/#{session[:id]}"
  end

  get '/error' do

  end

  get '/properties' do 
    
    @spaces = Space.all
    erb :properties
  end

  post '/bookings/:id' do
    user_id = session[:id]
    booking = Booking.create(user_id: user_id, space_id: params[:id])
    redirect "/profile/#{user_id}"
  end
 
  delete '/logout' do
    session.delete(:user_id)
    redirect '/'
  end

end
