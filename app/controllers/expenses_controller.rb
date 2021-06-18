class ExpensesController < ApplicationController

  get '/expenses' do
    @expenses = current_user.expenses
    erb :'/expenses/index.html'
  end

  get '/expenses/new' do
    @categories = current_user.categories
    erb :'/expenses/new.html'
  end

  post '/expenses' do
    @expense = Expense.new
    @expense.date = Date.today
    @expense.amount = params[:amount].to_f
    @expense.vendor = params[:vendor]
    @expense.description = params[:description]
    @expense.category_id = params[:category_id]
    @expense.user_id = current_user.id

    if @expense.save
      redirect "/expenses"
    else
      erb :'expenses/new.html'
    end

  end


end
