class ExpensesController < ApplicationController

  use Rack::MethodOverride

  before '/expenses*' do
    authentication_required
  end

  get '/expenses/new' do
    @categories = current_user.categories
    erb :'/expenses/new.html'
  end

  get '/expenses/:id/edit' do
    @expense = Expense.find_by_id(params[:id])
    @categories = current_user.categories
    erb :'/expenses/edit.html'
  end

  patch '/expenses/:id' do
    @expense = Expense.find_by_id(params[:id])
    @expense.update(amount: params[:amount])
    @expense.update(vendor: params[:vendor])
    @expense.update(description: params[:description])
    @expense.update(category_id: params[:category_id])
    redirect "/expenses/#{@expense.id}"
  end

  get '/expenses/:id' do
    @expense = Expense.find_by_id(params[:id])
    erb :'/expenses/show.html'
  end

  delete '/expenses/:id/c' do
    delete_expense
    redirect "/categories/#{params[:category_id]}"
  end

  delete '/expenses/:id/e' do
    delete_expense
    redirect '/expenses'
  end

  post '/expenses' do
    @expense = Expense.new
    @expense.date = Date.today
    @expense.user_id = current_user.id
    @expense.amount = params[:amount]
    @expense.vendor = params[:vendor]
    @expense.description = params[:description]

    if !params[:category_name].empty?
      Category.create(name: params[:category_name], user_id: current_user.id)
      @expense.category_id = current_user.categories.last.id
    else
      @expense.category_id = params[:category_id]
    end

    if @expense.valid? && @expense.save
      redirect "/expenses"
    else
      flash[:notice_red] = "A new expense requires an amount and a category."
      redirect '/expenses/new'
    end

  end

  get '/expenses' do
    @expenses = current_user.expenses
    erb :'/expenses/index.html'
  end

  helpers do

    def delete_expense
      @expense = Expense.delete(params[:id])
    end

  end

end
