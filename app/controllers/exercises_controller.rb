class ExercisesController < ApplicationController

  #Create
    get "/:username/workouts/:id/exercises/new" do
      @workout = Workout.find(params[:id])
      erb :"/exercises/new.html"
    end

    post "/:username/workouts/:id/exercises" do
      @workout = Workout.find(params[:id])
      @workout.exercises.create(params[:exercise])

      redirect "/#{params[:username]}/workouts/#{params[:id]}"
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

