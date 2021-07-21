class TasksController < ApplicationController

  def index
    @user = current_user
    @tasks = @user.tasks
    @plans = @user.plans.where(start_date: Time.current.beginning_of_week..Time.current.end_of_week)
    @task_per = @tasks.where(fin: true).count.to_f / @tasks.count.to_f
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :title, :body, :importance, :genre, :deadline, :fin)
  end



end
