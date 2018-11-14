class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def collaborator_projects
    self.user.projects
  end

  def collaborator_project_names
    self.collaborator_projects.collect {|p| p.name}
  end

end
