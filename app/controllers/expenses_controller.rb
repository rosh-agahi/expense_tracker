class ExpensesController < ApplicationController

  use Rack::MethodOverride

  get '/expenses/new' do
    @categories = current_user.categories
    erb :'/expenses/new.html'
  end

  get '/expenses/:id/edit' do
    @expense = Expense.find_by_id(params[:id])
    @categories = current_user.categories
    erb :'/expenses/edit.html'
  end

  delete '/expenses/:id' do
    @expense = Expense.delete(params[:id])
    redirect '/expenses'
  end

  post '/expenses' do
    @expense = Expense.new
    @expense.date = Date.today
    @expense.amount = params[:amount]
    @expense.vendor = params[:vendor]
    @expense.description = params[:description]
    @expense.category_id = params[:category_id]
    @expense.user_id = current_user.id

    if @expense.valid? && @expense.save
      redirect "/expenses"
    else
      flash[:notice_red] = "The amount entered was invalid. If entering an amount less than 1, place a 0 before the decimal. If entering whole numbers, please place two zeros in the decimal places. Acceptable inputs include '23.00', '1.00', '0.97'"
      redirect '/expenses/new'
    end

  end

  get '/expenses' do
    @expenses = current_user.expenses
    erb :'/expenses/index.html'
  end


end
