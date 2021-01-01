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

  # sign up
  get "/signup" do
    erb :"users/signup.html"
  end

  post "/signup" do
    #creates a user
    #users need all credentials
    #users can't create an account where username already exists
    if params[:username].empty? || params[:email].empty? || params[:password].empty? || params[:first_name].empty? || params[:last_name].empty?
      @error = "Please fill out all the fields"
      redirect "/signup"
    elsif User.find_by(username: params[:username])
      @error = "Username already taken, please create another"
      redirect "/signup"
    else
        @user = User.create(params)
    end

    #login the user with sessions
    session[:user_id] = @user.id
    redirect "/workouts"
  end
  
end
