class PlansController < ApplicationController
  before_action :set_plan, only: [:edit, :update, :destroy, :calendarupdate]


  def index
    @user = current_user
    @plan = Plan.new
    @plans = @user.plans
    @tasks = @user.tasks
  end

  def edit

  end


  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:success] = "保存に成功しました！"
      redirect_to plans_path
    else
      flash[:alert] = "保存に失敗しました"
      redirect_to plans_path
    end
  end


  def update
    if @plan.update(plan_params)
      flash[:success] = "更新に成功しました！"
      redirect_to plans_path
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to plans_path
    end
  end

  def calendarupdate
    respond_to do |format|
      if @plan.update(plan_params)
        format.js { @status = "success" }
      else
        format.js { @status = "fail" }
      end
    end
  end


  def destroy
    if @plan.destroy
      flash[:success] = "削除に成功しました！"
      redirect_to plans_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to plans_path
    end
  end

  private

    def set_plan
      @plan = Plan.find(params[:id])
    end


    def plan_params
      params.require(:plan).permit(:user_id, :title, :description, :start_date, :end_date)
    end
end
