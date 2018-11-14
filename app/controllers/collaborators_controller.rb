class CollaboratorsController < ApplicationController

  before_action :get_collaborator, only: [:show, :destroy]
  before_action :find_project

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(user_id: params[:collaborator][:user_id], project_id: params[:project_id])
    if @collaborator.valid?
      @collaborator.save
      redirect_to project_path(@collaborator.project_id)
    else
      render :new
    end
  end

  def show

  end

  def destroy
    @collaborator.destroy
    redirect_to project_path(@collaborator.project)
  end

  private

    def get_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    def find_project
      @project = Project.find(params[:project_id])
    end

    def collab_params
      params.require(:collaborator).permit(:user_id, :project_id)
    end

end
