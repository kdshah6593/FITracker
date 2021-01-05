require 'sinatra/flash'
class UsersController < ApplicationController

  # login
  get "/login" do
    binding.pry
    if logged_in?
      redirect "/workouts"
    else
      erb :"users/login.html"
    end
  end

  post "/login" do
    if params[:username].empty? || params[:password].empty?
      flash[:message] = "Please enter both username and password"
      binding.pry
      redirect "/login"
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/workouts"
      else
        @error = "Incorrect Password"
        redirect "/login"
      end
    end
  end
# -------------------------------------------------------------------
  #logout
  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end
# -------------------------------------------------------------------
  # signup
  get "/signup" do
    if logged_in?
      redirect "/workouts"
    else
      erb :"users/signup.html"
    end
  end

  post "/signup" do #need all creds, check username exists
    if params[:username].empty? || params[:email].empty? || params[:password].empty? || params[:first_name].empty? || params[:last_name].empty?
      @error = "Please fill out all the fields"
      redirect "/signup"
    elsif User.find_by(username: params[:username])
      @error = "Username already taken, please create another"
      redirect "/signup"
    else #create user and log in
        @user = User.create(params)
        session[:user_id] = @user.user_id
        redirect "/workouts"
    end
  end

  # -------------------------------------------------------------------
  # show page for user & all their workouts
  get "/:username" do
    if logged_in?
      @user = User.find_by(username: params[:username])
      erb :"users/show.html"
    else
      redirect "/login"
    end
  end


end
