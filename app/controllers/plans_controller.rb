class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy, :calendarupdate]


  def index
    @plans = current_user.plans
    @tasks = current_user.tasks
  end


  def show
    @plan = Plan.find(params[:id])
  end


  def new
    @plan = Plan.new
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
        # format.html { redirect_to plans_path }
        # format.json { render :show, status: :ok, location: @plan }
        format.js { @status = "success" }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @plan.errors, status: :unprocessable_entity }
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
      params.require(:plan).permit(:user_id, :title, :description, :start_date, :end_date, :allday)
    end
end
