# TODO
1. create migrations [x]
2. create models with relationships [x]
3. plan out routes for controllers [x]
4. build controller actions and views [x]


# Project Requirements
1. Build an MVC (Links to an external site.) Sinatra application.
2. Use ActiveRecord (Links to an external site.) with Sinatra. [x]
3. Use multiple models. [x]
4. Use at least one has_many relationship on a User model and one belongs_to relationship on another model. [x]
5. Must have user accounts - users must be able to sign up, sign in, and sign out. [x]
6. Validate uniqueness of user login attribute (username or email). [x]
7. Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user. [x]
8. Ensure that users can edit and delete only their own resources - not resources created by other users. [x]
9. Validate user input so bad data cannot be persisted to the database.
10. BONUS: Display validation failures to user with error messages (Links to an external site.). (This is an optional feature, challenge yourself and give it a shot!)

# Project Idea
# FiTracker - exercise tracker
# Models - 1) User 2) Workout 3) Exercises
 1. User has many workouts | User has many exercises through workouts | Workout belongs to User | Workout has many exercises | Exercise belongs to a workout
 2. Workout needs a User ID, Exercise needs a Workout ID
 3. Home Page - Options to Log in or Sign Up
 4. Logged in - See a feed of users' last workout | nav links to user profile
 5. User page - feed of workouts (which are links to individual workouts)
 6. Workout page - Shows the lists of exercises the user added for that specific workout


 User Table = id | first name | last name | age | username | password_digest | email
 Workout table = id | title (how to name this??) | timestamps | user_id
 Exercise Table = id | name | type (radio buttons) | reps (number) | sets (number) | time (number) | timestamps
 
 - Make sure the forms for these tables when filled out are filled with valid inputs; no blanks!


 Need helper methods for logged_in? and current_user | use Sessions| use BCrypt | ==> use these to ensure user only editting or deleting their own workouts/exercises

 Create a workout --> form for workout
 Read the workout --> show page of that workout; lists the exercises; create/add exercise link; delete exercise link; edit workout link ; delete workout link
 Edit the workout --> form to update workout
 Delete the workout --> deletes workout; redirect to user page

 Create a exercise --> form for exercise (the action request should be for workout so /workouts/3/exercise...)
 Read the exercise --> shows the individual stats of exercise
 Edit the exercise --> form to update exercise
 Delete the exericse --> deletes exercise; redirec to workout page

 



 -----------------------------

# Additional Features
1. Add User ability to update username & password info 
2. Add Comments to People's Workouts
3. Include Videos for Exercises to show form & hitting new goals