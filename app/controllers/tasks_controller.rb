class TasksController < ApplicationController

  def index
    @current_user = User.find_by(id: session[:user_id])
    @tasks = @current_user.projects.collect {|t| t.name}
  end

  def show
    @task = Task.find(params[:id])
  end
end
