class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy, :calendarupdate]


  def index
    @user = current_user
    @plan = Plan.new
    @plans = @user.plans
    @tasks = @user.tasks
  end


  def show
    @plan = Plan.find(params[:id])
  end



  def edit
    @plan = Plan.find(params[:id])
  end


  def create
    @plan = Plan.new(plan_params)
    @plan.save
    redirect_to plans_path
  end


  def update
    @plan.update(plan_params)
    redirect_to plans_path
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
    @plan.destroy
    redirect_to plans_path
  end

  private

    def set_plan
      @plan = Plan.find(params[:id])
    end


    def plan_params
      params.require(:plan).permit(:user_id, :title, :description, :start_date, :end_date)
    end
end
