class UsersController < ApplicationController

  # login
  get "/login" do
    erb :"users/login.html"
  end

  post "/login" do
    if params[:username].empty? || params[:password].empty?
      @error = "Please enter both username and password"
      redirect "/login"
    else
      if @user = User.find_by(username: params[:username], password: params[:password])
        session[user_id] = @user.id
        redirect "/workouts"
      else
        @error = "Account not found"
        redirect "/login"
      end
    end
  end
# -------------------------------------------------------------------
  #logout
  get "/logout" do
    session.clear
    redirect '/'
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
  
end
