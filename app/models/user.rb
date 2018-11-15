class User < ApplicationRecord
  has_secure_password
  has_many :collaborators
  has_many :projects, through: :collaborators
  has_many :notes

  validates :name, presence: true
  validates :username, presence:true, uniqueness: true
  validates :email, presence:true, uniqueness: true
  validates :password, presence:true


   def user_projects
     self.projects
   end

   def projects_not_started_count
     user_projects.select {|p| p.status == "Not Started"}.count
   end

   def projects_in_progress_count
     user_projects.select {|p| p.status == "In Progress"}.count
   end

   def completed_projects_count
     user_projects.select {|p| p.status == "Complete"}.count
   end

   def user_project_names
     user_projects.collect {|project| project.name}
   end

   def user_tasks
     user_projects.collect {|project| project.tasks}
   end

   def user_task_names
     user_tasks.collect {|task| task.name}
   end

   def user_notes
     user_projects.collect {|project| project.notes}
   end

   def capitalize_stuff
     self.name.split.map{|x| x.capitalize}.join(" ")
   end

end
