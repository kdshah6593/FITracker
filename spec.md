# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    - required Sinatra gem
- [x] Use ActiveRecord for storing information in a database
    - required ActiveRecord gem
- [x] Include more than one model class (e.g. User, Post, Category)
    - have User, Workout, and Exercise model classes
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - User has_many Workouts; Workout has_many Exercises
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - Workout belongs_to User; Exercise belongs_to Workout
- [x] Include user accounts with unique login attribute (username or email)
    - Have User model; Form asks for username and checks that username does not already exist in database before creating the user
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - Workout resource had CRUD; Exercise has CUD because is R is built into Workout
- [x] Ensure that users can't modify content created by other users
    - Used helper methods & sessions to establish the current user logged in and routes controller actions only fire if current_user matches up with the resource's user.
- [x] Include user input validations
    - when filling out form, when request is posted, checks that certain required fields are not blank
    - for exercise, not all fields may be filled out, so only title is required
    - otherwise, it sends you back to that same form
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - used sinatra-flash and displayed various error messages when forms filled out incorrectly
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - listed out how to download and start the webapp, what the webapp is about, including contributors and guide and link to MIT license

Confirm
- [x] You have a large number of small Git commits
    - Currently have over 90+ commits
- [x] Your commit messages are meaningful
    - Associated messages with the changes
- [x] You made the changes in a commit that relate to the commit message
    - See above
- [x] You don't include changes in a commit that aren't related to the commit message
    - Kept small commits; tried to avoid making changes on multiple files and committing unless the files related