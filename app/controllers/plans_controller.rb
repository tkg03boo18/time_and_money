class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]


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

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan }
        format.json { render :show, status: :created, location: @plan }
        format.js { @status = "success" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end

    end
  end


  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan }
        format.json { render :show, status: :ok, location: @plan }
        format.js { @status = "success" }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
        format.js { @status = "fail" }
      end
    end
  end


  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
  end

  private

    def set_plan
      @plan = Plan.find(params[:id])
    end


    def plan_params
      params.require(:plan).permit(:user_id, :title, :description, :start_date, :end_date, :allday)
    end
end
