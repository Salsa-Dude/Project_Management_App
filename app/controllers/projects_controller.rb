class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update, :destroy]
  def index
    @current_user = User.find_by(id: session[:user_id])
   
  end
    # @projects = @current_user.projects
 

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.valid?
      @project.save
      redirect_to project_path(@project)
    else
      render:new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update!(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
    def get_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :due_date, :status)
    end
end
