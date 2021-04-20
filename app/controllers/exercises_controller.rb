require 'sinatra/flash'
class ExercisesController < ApplicationController

  #Create
    get "/:username/workouts/:id/exercises/new" do
      begin
        if logged_in?
          @workout = Workout.find_by(id: params[:id])
          if @workout && @workout.user == current_user
            erb :"/exercises/new.html"
          else
            redirect "/#{@workout.user.username}/workouts/#{@workout.id}"
          end
        else
          redirect "/login"
        end
      rescue ActiveRecord::RecordNotFound
        halt(404)
      end
    end

    post "/:username/workouts/:id/exercises" do
      if logged_in?
        if !params[:exercise][:title].empty?
          @workout = Workout.find_by(id: params[:id])
          @workout.exercises.create(params[:exercise])
          redirect "/#{params[:username]}/workouts/#{params[:id]}"
        else
          flash[:message] = "Exercise must include at least a title"
          redirect "/#{params[:username]}/workouts/#{params[:id]}/exercises/new"
        end
      else
        redirect "/login"
      end
    end

  #Edit
    get "/exercises/:id/edit" do
      if logged_in?
        @exercise = Exercise.find_by(id: params[:id])
        if @exercise && @exercise.workout.user == current_user
          erb :"/exercises/edit.html"
        else
          redirect "/workouts"
        end
      else
        redirect "/login"
      end
    end

    patch "/exercises/:id" do
      if logged_in?
        if params[:exercise][:title] == ""
          redirect "exercises/#{params[:id]}/edit"
        else
          @exercise = Exercise.find_by(id: params[:id])
          if @exercise && @exercise.workout.user == current_user
            @exercise.update(params[:exercise])
            @workout = Workout.find(@exercise.workout_id)
      
            redirect "/#{@workout.user.username}/workouts/#{@workout.id}"
          else
            redirect "/workouts"
          end
        end
      else
        redirect "/login"
      end
    end

  #Delete
    get "/exercises/:id/delete" do
      if logged_in?
        @exercise = Exercise.find_by(id: params[:id])
        if @exercise && @exercise.workout.user == current_user
          @workout = Workout.find(@exercise.workout_id)
          @exercise.destroy
          redirect "/#{@workout.user.username}/workouts/#{@workout.id}"
        end
        redirect "/workouts"
      else
        redirect "/login"
      end
    end

end

