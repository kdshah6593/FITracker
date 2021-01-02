class WorkoutsController < ApplicationController

  #Create
    get "/workouts/new" do
      erb :"/workouts/new.html"
    end

    post "/workouts" do
      @workout = Workout.create(params[:workout])
      @workout.user = current_user
      @workout.save

      redirect "/workouts/#{current_user.username}/#{@workout.id}"
    end

  #Read
    get "/workouts" do
      @workouts = Workout.all
      erb :"/workouts/index.html"   ######
    end

    get "/:username/workouts/:id" do
      @workout = Workout.find(params[:id])
      erb :"/workouts/show.html"    #######
    end

  #Edit
    get "/:username/workouts/:id/edit" do
      @workout = Workout.find(params[:id])
      erb :"/workouts/edit.html"
    end

    patch "/:username/workouts/:id" do
      redirect "/:username/workouts/:id"
    end

  #Delete
    delete "/:username/workouts/:id/delete" do
      redirect "/:username"
    end
  
end
