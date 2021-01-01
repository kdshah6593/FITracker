class UsersController < ApplicationController

  # login
  get "/login" do
    #erb a login form
  end

  post "/login" do
    redirect "/workouts"
  end

  # sign up
  get "/sign-up" do
    #erb a sign-up form
  end

  post "/sign-up" do
    #creates a user
    #login the user with sessions
    redirect "/workouts"
  end
  
end
