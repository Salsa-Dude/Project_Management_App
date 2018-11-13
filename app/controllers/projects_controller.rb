class ProjectsController < ApplicationController

  def index
    # @user = get_current_user
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
end
