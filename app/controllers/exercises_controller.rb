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
    get "/exercises/:id/edit" do
      @exercise = Exercise.find(params[:id])
      erb :"/exercises/edit.html"
    end

    patch "/exercises/:id" do
      @exercise = Exercise.find(params[:id])
      @exercise.update(params[:exercise])
      @workout = Workout.find(@exercise.workout_id)
      
      redirect "/#{@workout.user.username}/workouts/#{@workout.id}"
    end

  #Delete
    get "/exercises/:id/delete" do
      @exercise = Exercise.find(params[:id])
      @workout = Workout.find(@exercise.workout_id)
      @exercise.destroy
      redirect "/#{@workout.user.username}/workouts/#{@workout.id}"
    end
  
end

