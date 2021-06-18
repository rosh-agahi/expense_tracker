class ExpensesController < ApplicationController

  get '/expenses' do
    erb :'/expenses/index.html'
  end

  get '/expenses/new' do
    @categories = current_user.categories
    erb :'/expenses/new.html'
  end

  post '/expenses/new' do
    @expense = Expense.new
    @expense.date = Date.today
    @expense.amount = params[:amount]
    @expense.vendor = params[:vendor]
    @expense.description = params[:description]
    @expense.category_id = params[:category_id]
    @expense.user_id = current_user.id

    if @expense.save
      redirect "/expenses"
    else
      erb :'users/new.html'
    end

  end


end
