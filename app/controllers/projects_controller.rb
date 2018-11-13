class ProjectsController < ApplicationController

  def index
    @current_user = User.find_by(id: session[:user_id])
   
  end
    # @projects = @current_user.projects
 

  def show
    @project = Project.find(params[:id])
  end
end
