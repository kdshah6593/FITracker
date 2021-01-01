class ExercisesController < ApplicationController

  #Create
    #New Exercise - Form GET
    get "/workouts/username/workout_id/exercises/new" do
      erb :"/exercises/new.html"
    end

    #Add Workout POST
    post "/workouts/username/workout_id/exercises" do
      redirect "/workouts"
    end

  #Read
    #Read all exercises in a workout for a user
    get "/workouts/username/workout_id/exercises" do
      erb :"/workouts/index.html"
    end

    #Read a specific exercise in a workout by a specific user - the show page
    get "/workouts/username/workout_id/exercises/:id" do
      # erb :"/workouts/show.html"
    end

  #Edit
    #Edit a workout - Form GET
    get "/workouts/username/workout_id/exercises/:id/edit" do
      erb :"/workouts/edit.html"
    end
    #Update the workout - PATCH
    patch "/workouts/username/workout_id/exercises/:id" do
      redirect ""
    end

  #Delete
    #Delete a workout
    delete "/workouts/username/workout_id/exercises/:id" do
      redirect 
    end
  
end


# Exercises
#For exercises, they are within a specific workout within a specific user
#/workouts/username/workout_id/

#Index GET /exercises           => /workouts/username/workout_id/exercises
#New   GET /exercises/new       => /workouts/username/workout_id/exercises/new
#Create POST /exercises         => /workouts/username/workout_id/exercises
#Show GET /exercises/:id        => /workouts/username/workout_id/exercises/:id
#Edit GET /exercises/:id/edit   => /workouts/username/workout_id/exercises/:id/edit
#Update PATCH /exercises/:id    => /workouts/username/workout_id/exercises/:id
#Delete DELETE /exercises/:id   => /workouts/username/workout_id/exercises/:id

