class ProjectsController < ApplicationController

  def index
    @current_user = User.find_by(id: session[:user_id])
    @projects = @current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end
end
