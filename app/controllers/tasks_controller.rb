class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :update, :destroy]
  before_action :find_project

  def index
    @tasks = current_user.user_tasks.flatten
  end

  def new
    @task = Task.new
  end

  def create
    date = params[:task][:"due_date(3i)"]+"/"+params[:task][:"due_date(2i)"]+"/"+ params[:task][:"due_date(1i)"]
    @task = Task.new(name: params[:task][:name],
      description: params[:task][:description], due_date: date,
      status: params[:task][:status], project_id: params[:project_id])
    if @task.valid?
      @task.save
      current_user.user_tasks << @task
      redirect_to project_task_path(@project.id, @task.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    date = params[:task][:"due_date(3i)"]+"/"+params[:task][:"due_date(2i)"]+"/"+ params[:task][:"due_date(1i)"]
    if @task.update!(name: params[:task][:name],
      description: params[:task][:description], due_date: date,
      status: params[:task][:status], project_id: params[:project_id])
      redirect_to project_task_path(@project.id, @task.id)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project.id)
  end

  private
    def get_task
      @task = Task.find(params[:id])
    end

    def find_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :due_date, :status, :project_id)
    end

end
