class User < ActiveRecord::Base
    has_many :workouts
    has_many :exercises, through: :workouts
end
