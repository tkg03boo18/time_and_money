class TasksController < ApplicationController
  
  def index
    @user = current_user
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new
    @task.save
    redirect_to tasks_path
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  
  
end
