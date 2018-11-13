class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.user_tasks.flatten
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.valid?
      @task.save
      current_user.user_tasks << @task
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update!(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
    def get_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :due_date, :status, :project_id)
    end

end
