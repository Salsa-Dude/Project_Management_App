class User < ApplicationRecord
has_many :collaborators
has_many :projects, through: :collaborators
has_many :notes


 def user_projects
   self.projects
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

end
