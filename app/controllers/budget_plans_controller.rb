class BudgetPlansController < ApplicationController
    before_action :set_budget_plan, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @budget_plans = @user.budget_plans
  end

  def new
    @budget_plan = BudgetPlan.new
  end

  def create
    @budget_plan = BudgetPlan.new(budget_plan_params)
    respond_to do |format|
      if @budget_plan.save
        format.html { redirect_to budget_plans_path }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @budget_plan = BudgetPlan.find(params[:id])
  end

  def edit
    @budget_plan = BudgetPlan.find(params[:id])
  end

  def update
    @budget_plan = BudgetPlan.find(params[:id])
    @budget_plan.update(budget_plan_params)
    redirect_to budget_plans_path
  end

  def destroy
    @budget_plan = BudgetPlan.find(params[:id])
    @budget_plan.destroy
    redirect_to budget_plans_path
  end

  private

  def set_budget_plan
    @budget_plan = BudgetPlan.find(params[:id])
  end

  def budget_plan_params
    params.require(:budget_plan).permit(:user_id, :main_category_id, :sub_category_id, :date, :amount)
  end
end
