ENV['RACK_ENV'] ||= 'development'

require "sinatra/base"
require_relative "data_mapper_setup"
require 'sinatra/flash'

class BookMarkManager < Sinatra::Base
enable :sessions
set :sessions_secret, 'super sercret'
register Sinatra::Flash

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users/new' do
  @user = User.create(user_name: params[:user_name],
            password: params[:password],
            password_repeat: params[:password_repeat],
            email: params[:email])
  if @user.save
    session[:user_id] = @user.id
    redirect '/links/'
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/new' do
  erb :users/new
end

get '/links/new' do
  erb :links/new
end

post '/links' do
  link = Link.create(url: params[:url], title: params[:title])
  params[:tags].split.each do |tag|
    link.tags << Tag.create(name: tag)
  end
  link.save
  redirect to('/links')
end

get '/links' do
  @links = Link.all
  erb :links
end

get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end


  run! if app_file == $0
end
