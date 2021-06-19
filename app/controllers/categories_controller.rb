class CategoriesController < ApplicationController

  get '/categories' do
    @categories = current_user.categories
    erb :'/categories/index.html'
  end

  get '/categories/new' do
    erb :'/categories/new.html'
  end

  post '/categories' do
    @category = Category.new
    @category.name = params[:name]
    @category.user_id = current_user.id

    if @category.save
      redirect "/categories"
    else
      erb :'categories/new.html'
    end

  end


end
