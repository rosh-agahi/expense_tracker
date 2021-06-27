class UsersController < ApplicationController

  before '/users/*'do
    authentication_required
  end

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
      new_user_errors
      redirect '/register'
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

  def new_user_errors
    if @user.errors.include?("username")
      flash[:notice_red] = "Username is taken. Please use a unique username."
    elsif @user.errors.include?("name") || @user.errors.include?("password")
      flash[:notice_red] = "Registration requires a name, unique username, and password."
    end
  end

end
