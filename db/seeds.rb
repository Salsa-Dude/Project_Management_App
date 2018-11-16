# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Project.destroy_all
Task.destroy_all
Note.destroy_all
Collaborator.destroy_all

user1 = User.create(name: "Joseph", username: "jarias3", email: "joe@gmail.com", password: "joseph")
user2 = User.create(name: "Beth", username: "bw7", email: "beth@gmail.com", password: "beth")
user3 = User.create(name: "Mike", username: "mikekim", email: "mike@gmail.com", password: "mike")
user4 = User.create(name: "Ana", username: 'anaH', email: "ana@gmail.com", password: "ana")

project1 = Project.create(name: "make a command line app", description:
"description",
due_date: DateTime.new(2018, 10, 20), status: "Complete")
project2 = Project.create(name: "make a website", description: "Congratulations, we are starting project mode!
  This means that you'll spend the rest of the week working in a team to build out a Rails project of your choice.
There will be some lectures and new material scheduled throughout the week, but the bulk of the time will be working on your projects.",
due_date: DateTime.new(2018, 11, 16), status: "In Progress")
project3 = Project.create(name: "eat some cereal", description: "There is nothing more satifying than to eat some cereal in the morning, afternoon, or evening.
  Cereal is a great snack. Carbs make you feel amazing!",
  due_date: DateTime.new(2018, 11, 16), status: "Not Started")

Collaborator.create(user_id: 4, project_id: 3)
Collaborator.create(user_id: 3, project_id: 1)
Collaborator.create(user_id: 1, project_id: 3)
Collaborator.create(user_id: 2, project_id: 2)

task1 = Task.create(name: "Pick a cereal to eat", description: "Pick from among the many types of cereals out there. Sweet? Healthier? Kid-Cereal? ...Lucky Charms? Cap'n Crunch? Honey Bunches? Rasin Bran? Kix??", due_date: DateTime.new(2018, 12, 25), status: "Not Started", project_id: 3)
task2 = Task.create(name: "choose a theme", description: "We need to figure out what kind of command line app we want to make. I like soccer. Do you?", due_date: DateTime.new(2018, 11, 13), status: "Not Started", project_id: 1)
task3 = Task.create(name: "Create the Models", description: "You should have least five models. You do not have to have all of these built out on day one. But by the end of the week, you should have at least five models.", due_date: DateTime.new(2018, 10, 25), status: "Complete", project_id: 2)
task4 = Task.create(name: "Moqup the layout", description: "Plan out each page. Which colors? Which pages?", due_date: DateTime.new(2018, 11, 14), status: "In Progress", project_id: 2)
task5 = Task.create(name: "connect to an API", description: "Use JSON and RestClient AFTER you find a good API. Don't use a bad API.", due_date: DateTime.new(2000, 10, 15), status: "In Progress", project_id: 1)

note1 = Note.create(content: "This website is dope!", project_id: 2, user_id: 1)
note2 = Note.create(content: "We need to have the same format for all of our menus.", project_id: 1, user_id: 4)
note3 = Note.create(content: "Lots of people are named Ronaldo. We need a better search feature.", project_id: 1, user_id: 2)
note4 = Note.create(content: "Catch me if you can", project_id: 3, user_id: 3)
