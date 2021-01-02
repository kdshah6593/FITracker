class WorkoutsController < ApplicationController

  #Create
    get "/workouts/new" do
      if logged_in?
        erb :"/workouts/new.html"
      else
        redirect "/login"
      end
    end

    post "/workouts" do
      if logged_in?
        if !params[:workout][:title].empty? || !params[:workout][:workout_type].empty?
          @workout = Workout.create(params[:workout])
          @workout.user = current_user
          @workout.save
          redirect "/workouts/#{current_user.username}/#{@workout.id}"
        else
          @error = "Make sure to fill out each item"
          redirect "/workouts/new"
        end
      else
        redirect "/login"
      end
    end

  #Read
    get "/workouts" do
      if logged_in?
        @workouts = Workout.all
        erb :"/workouts/index.html"
      else
        redirect "/login"
      end
    end

    get "/:username/workouts/:id" do
      if logged_in?
        @workout = Workout.find(params[:id])
        erb :"/workouts/show.html"
      else
        redirect "/login"
      end
    end

  #Edit
    get "/:username/workouts/:id/edit" do
      if logged_in?
        @workout = Workout.find(params[:id])
        if @workout && @workout.user == current_user
          erb :"/workouts/edit.html"
        else
          redirect "/#{params[:username]}"
        end
      else
        redirect "/login"
      end
    end

    patch "/:username/workouts/:id" do
      if logged_in?
        if params[:workout][:title] == "" || !params[:workout][:workout_type] == ""
          redirect "/#{params[:username]}/workouts/#{params[:id]}/edit"
        else
          @workout = Workout.find(params[:id])
          if @workout && @workout.user == current_user
            @workout.update(params[:workout])
            redirect "/#{params[:username]}/workouts/#{params[:id]}"
          else
            redirect "/workouts"
          end
        end
      else
        redirect "/login"
      end
    end

  #Delete
    get "/:username/workouts/:id/delete" do
      if logged_in?
        @workout = Workout.find(params[:id])
        if @workout && @workout.user == current_user
          @workout.destroy
        end
        redirect "/#{params[:username]}"
      else
        redirect "/login"
      end
    end
  
end
