class ExercisesController < ApplicationController

  #Create
    #New Exercise - Form GET
    get "/:username/workouts/:id/exercises/new" do
      erb :"/exercises/new.html"
    end

    #Add Exercise POST
    post "/:username/workouts/:id/exercises" do
      redirect "/:username/workouts/:id"
    end

  #Edit
    #Edit an exercise - Form GET
    get "/:username/workouts/:id/exercises/edit" do
      erb :"/exercises/edit.html"
    end

    #Update the exercise - PATCH
    patch "/:username/workouts/:id/exercises/" do
      redirect "/:username/workouts/:id"
    end

  #Delete
    #Delete a exercise
    delete "/workouts/username/workout_id/exercises/:id" do
      redirect "/:username/workouts/:id"
    end
  
end

