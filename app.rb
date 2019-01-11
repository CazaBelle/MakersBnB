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
        redirect('/profile/id')
      else
        redirect'/error'
      end
  end

  get '/profile/:id/listspace' do
    @user = User.get(session[:user_id])
    erb (:list_space)
  end

  post '/profile/:id/listspace' do
    @user = User.get(session[:user_id])
    space = Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: params[:user_id])
    session[:space_id] = space.id
    redirect '/profile/:id'
  end

  get "/error" do

  end

  get '/profile/:id' do
    @user = User.get(session[:user_id])
    erb (:profile)
  end

end
