class CollaboratorsController < ApplicationController

  before_action :get_collaborator, only: [:show, :destroy]
  def new
    @collaborator = Collaborator.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user 
      @collaborator = Collaborator.new(user_id: user.id, project_id: params[:project_id])
      if @collaborator.valid?
        @collaborator.save
        redirect_to project_path(@collaborator.project_id)
      else
        render :new
      end
    else  
      redirect_to new_collaborator_path
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

    def collab_params
      params.require(:collaborator).permit(:user_id, :project_id)
    end

end
