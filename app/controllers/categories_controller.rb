class CategoriesController < ApplicationController

  before '/categories*' do
    authentication_required
  end

  get '/categories' do
    @categories = current_user.categories
    erb :'/categories/index.html'
  end

  get '/categories/new' do
    erb :'/categories/new.html'
  end

  get 'categories/:id/edit' do
    find_category
    erb :'/categories/edit.html'
  end

  patch '/categories/:id' do
    find_category

    if existing_category_name
      flash[:notice_red] = "Category with this name already exists. Can't change this category name."
      redirect "/categories/#{@category.id}/edit"
    else

    @category.update(name: params[:name])
    redirect "/categories/#{@category.id}"

  end

  get '/categories/:id' do
    find_category
    erb :'/categories/show.html'
  end

  delete '/categories/:id' do
    @category = Category.delete(params[:id])
    redirect "/categories"
  end

  post '/categories' do
    if existing_category_name
      flash[:notice_red] = "Category already exists."
      redirect "/categories/new"
    else
    @category = Category.new
    @category.name = params[:name]
    @category.user_id = current_user.id

      if @category.save
        redirect "/categories"
      else
        flash[:notice_red] = "Can't save a category without a name. Please enter a valid name for a category."
        erb :'categories/new.html'
      end
    end
  end

def find_category
  @category = Category.find_by_id(params[:id])
end

def existing_category_name
  !!current_user.categories.find_by_name(params[:name])
end

end
