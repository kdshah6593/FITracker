john = User.create(username: "johnsmith", password_digest: "password", first_name: "John", last_name: "Smith", email: "johnsmith@email.com")
jane = User.create(username: "janedoe", password_digest: "password", first_name: "Jane", last_name: "Doe", email: "janedoe@email.com")


w1 = Workout.create(title: "Cardiac Hill", workout_type: "Cardio" )
w2 = Workout.create(title: "Legs All Day", workout_type: "Strength" )


w1.exercises.create(title: "Run", sets: 1, reps: 1, distance: 5, duration: 30)
w2.exercises.create(title: "Squats", sets: 3, reps: 10)
w2.exercises.create(title: "Calf Raises", sets: 3, reps: 10)
w2.exercises.create(title: "Leg Press", sets: 3, reps: 10)

w1.user = john
w2.user = jane