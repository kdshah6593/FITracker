require 'sinatra/flash'
class UsersController < ApplicationController

  # login
  get "/login" do
    if logged_in?
      redirect "/workouts"
    else
      erb :"users/login.html"
    end
  end

  post "/login" do
    if params[:username].empty? || params[:password].empty?
      flash[:message] = "Please enter both username and password"
      redirect "/login"
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/workouts"
      else
        flash[:message] = "Incorrect Password"
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
    params[:first_name] = params[:first_name].strip
    params[:last_name] = params[:last_name].strip
    params[:username] = params[:username].strip
    if params[:username].empty? || params[:email].empty? || params[:password].empty? || params[:first_name].empty? || params[:last_name].empty?
      flash[:message] = "Please fill out all the fields"
      redirect "/signup"
    elsif params[:username].match(/[^a-zA-Z0-9]/)
      flash[:message] = "Please only use letters and numbers for the username"
      redirect "/signup"
    elsif User.find_by(username: params[:username])
      flash[:message] = "Username already taken, please create another"
      redirect "/signup"
    else #create user and log in
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect "/workouts"
    end
  end

  # -------------------------------------------------------------------
  # show page for user & all their workouts
  get "/:username" do
    begin
      if logged_in?
        @user = User.find_by(username: params[:username])
        erb :"users/show.html"
      else
        redirect "/login"
      end
    rescue NoMethodError
      halt(404)
    end
  end


end
