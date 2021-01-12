require './config/environment'
require 'dotenv/load'
require 'securerandom'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    # find out how to use ENV.fetch
    set :session_secret, "secretsecret"
  end

  not_found do
    redirect '/'
  end

  get "/" do
    erb :welcome
  end

  helpers do
    #want this to evaluate for truthiness, so use double bang
    def logged_in?
      !!current_user
    end

    #establishes current user using the session id after login request
    def current_user
      @current_user ||= @current_user = User.find(session[:user_id]) if session[:user_id]
    end
  end

end
