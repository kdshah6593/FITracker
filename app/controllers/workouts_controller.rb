require 'sinatra/flash'
class WorkoutsController < ApplicationController

  #Create
    get "/workouts/new" do
      not_logged_in
      erb :"/workouts/new.html"
    end

    post "/workouts" do
      not_logged_in
      if params[:workout][:title] == "" || params[:workout].has_key?(:workout_type) == false
        flash[:message] = "Make sure to fill out each item"
        redirect "/workouts/new"
      else
        @workout = Workout.create(params[:workout])
        @workout.user = current_user
        @workout.save
        redirect "/#{current_user.username}/workouts/#{@workout.id}"
      end
    end

  #Read
    get "/workouts" do
      not_logged_in
      @workouts_sorted = Workout.order(created_at: :desc)
      erb :"/workouts/index.html"
    end

    get "/:username/workouts/:id" do
      not_logged_in
      @workout = Workout.find_by(id: params[:id])
      if @workout && @workout.user.username == params[:username]
        erb :"/workouts/show.html"
      else
        redirect "/workouts"
      end
    end

  #Edit
    get "/:username/workouts/:id/edit" do
      not_logged_in
      @workout = Workout.find_by(id: params[:id])
      if @workout && @workout.user == current_user
        erb :"/workouts/edit.html"
      else
        redirect "/#{params[:username]}"
      end
    end

    patch "/:username/workouts/:id" do
      not_logged_in
      if params[:workout][:title] == "" || params[:workout].has_key?(:workout_type) == false
        redirect "/#{params[:username]}/workouts/#{params[:id]}/edit"
      else
        @workout = Workout.find_by(id: params[:id])
        if @workout && @workout.user == current_user
          @workout.update(params[:workout])
          redirect "/#{params[:username]}/workouts/#{params[:id]}"
        else
          redirect "/workouts"
        end
      end
    end

  #Delete
    delete "/:username/workouts/:id/delete" do
      not_logged_in
      @workout = Workout.find_by(id: params[:id])
      if @workout && @workout.user == current_user
        @workout.destroy
      end
      redirect "/#{params[:username]}"
    end

    private
    # def not_logged_in
    #   if !logged_in?
    #     redirect "/login"
    #   end
    # end

end
