class UsersController < ApplicationController

  get '/register' do
    erb :'users/new.html'
  end

  post '/users' do
    @user = User.new
    @user.name = params[:name]
    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
      redirect "/login"
    else
      erb :'users/new.html'
    end

  end

  get '/login' do
    erb :'users/login.html'
  end

  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    erb :'users/show.html'
  end

  post '/login' do
    #takes user login form info
    @user = User.find_by(:username => params[:username])

    #validates with password
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/"
    end
    #if the user exists and the password is correct, set the session id to the user id, redirect to user show page
    #otherwise redirect to the log in form
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
