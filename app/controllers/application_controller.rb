require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, "exptracker-1234"

    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user # hardens the true or false value return of current_user
    end

    def authentication_required
      if !logged_in?
        flash[:notice_red] = "You must be logged in."
        redirect '/login'
      end
    end

    def dollar_display(amount)
      ActiveSupport::NumberHelper.number_to_currency(amount, :unit => "$")
    end

  end


end
