class UsersController < ApplicationController

  get '/register' do
    erb :'users/new.html'
  end

  get '/login' do
    erb:'users/login.html'
  end 

end
