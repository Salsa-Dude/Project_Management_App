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
user3 = User.create(name: "Alex", username: "alex10", email: "alex@gmail.com", password: "alex")
user4 = User.create(name: "Max", username: 'salsadude', email: "max@gmail.com", password: "max")

project1 = Project.create(name: "project_1", description: "My first project", due_date: DateTime.new(2009, 9, 1), status: "In Progress")
project2 = Project.create(name: "project_2", description: "My second project", due_date: DateTime.new(2012, 7, 17), status: "Complete")
project3 = Project.create(name: "project_3", description: "My third project", due_date: DateTime.new(2018, 5, 20), status: "In Progress")

Collaborator.create(user_id: 4, project_id: 3)
Collaborator.create(user_id: 3, project_id: 1)
Collaborator.create(user_id: 1, project_id: 3)
Collaborator.create(user_id: 2, project_id: 2)

task1 = Task.create(name: "write content", description: "My first task", due_date: DateTime.new(1994, 12, 25), status: "Not Started", project_id: 3)
task2 = Task.create(name: "add button", description: "task one", due_date: DateTime.new(1998, 3, 5), status: "Not Started", project_id: 1)
task3 = Task.create(name: "make slidebar", description: "number 1 task", due_date: DateTime.new(2050, 2, 26), status: "In Progress", project_id: 2)
task4 = Task.create(name: "make navigation", description: "number 2 task", due_date: DateTime.new(1980, 8, 30), status: "In Progress", project_id: 2)
task5 = Task.create(name: "post photos", description: "task two", due_date: DateTime.new(2000, 10, 15), status: "In Progress", project_id: 1)

note1 = Note.create(content: "My first note", project_id: 2, user_id: 2)
note2 = Note.create(content: "Hello world", project_id: 1, user_id: 3)
note3 = Note.create(content: "Bye world", project_id: 1, user_id: 3)
note4 = Note.create(content: "Catch me if you can", project_id: 3, user_id: 1)
