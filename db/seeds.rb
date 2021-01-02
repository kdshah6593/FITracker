User.destroy_all
Workout.destroy_all
Exercise.destroy_all

john = User.create(username: "johnsmith", password: "password", first_name: "John", last_name: "Smith", email: "johnsmith@email.com")
jane = User.create(username: "janedoe", password: "password", first_name: "Jane", last_name: "Doe", email: "janedoe@email.com")


w1 = Workout.create(title: "Cardiac Hill", workout_type: "Cardio" )
w2 = Workout.create(title: "Legs All Day", workout_type: "Strength" )


e1 = Exercise.create(title: "Run", sets: 1, reps: 1, distance: 5, duration: 30)
e2 = Exercise.create(title: "Squats", sets: 3, reps: 10)
e3 = Exercise.create(title: "Calf Raises", sets: 3, reps: 10)
e4 = Exercise.create(title: "Leg Press", sets: 3, reps: 10)

w1.exercises << e1
w2.exercises << e2
w2.exercises << e3
w2.exercises << e4

john.workouts << w1
jane.workouts << w2