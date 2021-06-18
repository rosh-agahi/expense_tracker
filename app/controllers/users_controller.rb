class UsersController < ApplicationController

  get '/register' do
    erb :'users/new.html'
  end

end
