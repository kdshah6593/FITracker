# TODO
1. create migrations
2. create models with relationships
3. plan out routes for controllers
4. build controller actions and views


# Project Requirements
1. Build an MVC (Links to an external site.) Sinatra application.
2. Use ActiveRecord (Links to an external site.) with Sinatra.
3. Use multiple models.
4. Use at least one has_many relationship on a User model and one belongs_to relationship on another model.
5. Must have user accounts - users must be able to sign up, sign in, and sign out.
6. Validate uniqueness of user login attribute (username or email).
7. Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
8. Ensure that users can edit and delete only their own resources - not resources created by other users.
9. Validate user input so bad data cannot be persisted to the database.
10. BONUS: Display validation failures to user with error messages (Links to an external site.). (This is an optional feature, challenge yourself and give it a shot!)

# Project Idea
# FiTracker - exercise tracker
# Models - 1) User 2) Workout 3) Exercises 4) Workout_exercise
 1. User has many workouts | User has many exercises through workouts | Workout belongs to User | Workout has many exercises | Exercise has many workouts | workouts_exercises belongs to workouts | workouts_exercises belongs to exercises
 2. Workout needs a User ID, Exercise needs a Workout ID
 3. Home Page - Options to Log in or Sign Up
 4. Logged in - See a feed of users' last workout | nav links to user profile
 5. User page - feed of workouts (which are links to individual workouts)
 6. Workout page - Shows the lists of exercises the user added for that specific workout


 User Table = id | first name | last name | age | username | password_digest | email
 Workout table = id | title (how to name this??) | timestamps | user_id
 Exercise Table = id | name | type (radio buttons) | reps (number) | sets (number) | time (number) | timestamps
 workouts_exercises table = id | workout_id | exericse_id

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

 Instructions
1. Create a new repository on GitHub for your Sinatra application.
2. When you create the Sinatra app for your assessment, add the spec.md (Links to an external site.) file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.
3. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
4. While you're working on it, record a 30 min coding session with your favorite screen capture tool. During the session, either think out loud or not. It's up to you. You don't need to submit the video, but we may ask for it at a later time.
5. Make sure to create a good README.md with a short description, install instructions, a contributor's guide, and a link to the license (Links to an external site.) for your code.
6. Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement before you submit your project.
7. Prepare a short video demo with narration describing how a user would interact with your working application.
8. Write a blog post about the project and process.
9. When done, submit your GitHub repo's URL, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.