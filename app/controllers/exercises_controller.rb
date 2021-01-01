class ExercisesController < ApplicationController

  #Create
    #New Exercise - Form GET
    get "/workouts/username/workout_id/exercises/new" do
      erb :"/exercises/new.html"
    end

    #Add Exercise POST
    post "/workouts/username/workout_id/exercises" do
      redirect "/workouts/username/workout_id/exercises"
    end

  #Read
    #Read all exercises in a workout for a user
    get "/workouts/username/workout_id/exercises" do
      erb :"/exercises/index.html"
    end

    #Read a specific exercise in a workout by a specific user - the show page
    get "/workouts/username/workout_id/exercises/:id" do
      erb :"/exercises/show.html"
    end

  #Edit
    #Edit an exercise - Form GET
    get "/workouts/username/workout_id/exercises/:id/edit" do
      erb :"/exercises/edit.html"
    end
    #Update the exercise - PATCH
    patch "/workouts/username/workout_id/exercises/:id" do
      redirect "/workouts/username/workout_id/exercises/:id"
    end

  #Delete
    #Delete a exercise
    delete "/workouts/username/workout_id/exercises/:id" do
      redirect "/workouts/username/workout_id/exercises/"
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

