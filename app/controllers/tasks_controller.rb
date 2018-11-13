class TasksController < ApplicationController

  def index
    @current_user = User.find_by(id: session[:user_id])
    @tasks = @current_user.user_task_names
  end

  def show
    @task = Task.find(params[:id])
  end
end
