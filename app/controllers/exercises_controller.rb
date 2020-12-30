class ExercisesController < ApplicationController

  # GET: /exercises
  get "/exercises" do
    erb :"/exercises/index.html"
  end

  # GET: /exercises/new
  get "/exercises/new" do
    erb :"/exercises/new.html"
  end

  # POST: /exercises
  post "/exercises" do
    redirect "/exercises"
  end

  # GET: /exercises/5
  get "/exercises/:id" do
    erb :"/exercises/show.html"
  end

  # GET: /exercises/5/edit
  get "/exercises/:id/edit" do
    erb :"/exercises/edit.html"
  end

  # PATCH: /exercises/5
  patch "/exercises/:id" do
    redirect "/exercises/:id"
  end

  # DELETE: /exercises/5/delete
  delete "/exercises/:id/delete" do
    redirect "/exercises"
  end
end
