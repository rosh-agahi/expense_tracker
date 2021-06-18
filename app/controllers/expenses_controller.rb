class ExpensesController < ApplicationController

  get '/expenses' do
    erb :'/expenses/show.html'
  end

  get '/expenses/new' do
    erb :'/expenses/new.html'
  end

end
