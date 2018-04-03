class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(set_params)
    @new_task.save
  end

  def edit
    find_task
  end

  def update
    find_task
    @task.update(set_params)
    redirect_to task_path(@task)
  end

  def destroy
    find_task
    @task.destroy
    redirect_to tasks_path
  end

  private
  def set_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id].to_i)
  end
end
