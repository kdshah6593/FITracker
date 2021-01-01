class WorkoutsController < ApplicationController

  #Create
    #New Workout - Form GET
    get "/workouts/new" do
      erb :"/workouts/new.html"
    end

    #Add Workout POST
    post "/workouts" do
      redirect "/workouts"
    end

  #Read
    #Read all workouts by all users - the view page will show the recent workouts
    get "/workouts" do
      erb :"/workouts/index.html"
    end

    #Read all workouts by a user - the show page
    get "/workouts/:username" do
      #ERB File
    end

    #Read a specific workout by a specific user - the show page
    get "/workouts/:username/:id" do
      # erb :"/workouts/show.html"
    end

  #Edit
    #Edit a workout - Form GET
    get "/workouts/:username/:id/edit" do
      erb :"/workouts/edit.html"
    end
    #Update the workout - PATCH
    patch "/workouts/:username/:id" do
      redirect "/workouts/:username/:id"
    end

  #Delete
    #Delete a workout
    delete "/workouts/:username/:id/delete" do
      redirect "/workouts/:username"
    end
  
end
