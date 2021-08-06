class TasksController < ApplicationController

  def index
    @user = current_user
    @task = Task.new
    @tasks = @user.tasks
    @plans = @user.plans.where(start_date: Time.current.beginning_of_week..Time.current.end_of_week)
    @task_per = @tasks.where(fin: true).count.to_f / @tasks.count.to_f
  end



  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "保存に成功しました！"
      redirect_to tasks_path
    else
      flash[:alert] = "保存に失敗しました"
      redirect_to tasks_path
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "更新に成功しました！"
      redirect_to tasks_path
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:success] = "削除に成功しました"
      redirect_to tasks_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :title, :body, :importance, :urgency, :deadline, :fin)
  end



end
