class BudgetPlansController < ApplicationController
    before_action :set_budget_plan, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    if params[:month]
      @budget_plans = @user.budget_plans.where(date: Time.current.since(params[:month].to_i.months).beginning_of_month..Time.current.since(params[:month].to_i.months).end_of_month)
      @outcomes = @budget_plans.where(main_category_id: [2, 3])
      @incomes = @budget_plans.where(main_category_id: 1)
      @incomes_total_amount = 0
      @incomes.each do |income|
        @incomes_total_amount += income.amount
      end
      @fixed = @budget_plans.where(main_category_id: 2)
      @fixed_total_amount = 0
      @fixed.each do |fixed|
        @fixed_total_amount += fixed.amount
      end
      @variable = @budget_plans.where(main_category_id: 3)
      @variable_total_amount = 0
      @variable.each do |variable|
        @variable_total_amount += variable.amount
      end
      @investment = @budget_plans.where(main_category_id: 4)
      @investment_total_amount = 0
      @investment.each do |investment|
        @investment_total_amount += investment.amount
      end
    else
      @budget_plans = @user.budget_plans.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
      @outcomes = @budget_plans.where(main_category_id: [2, 3])
      @incomes = @budget_plans.where(main_category_id: 1)
      @incomes_total_amount = 0
      @incomes.each do |income|
        @incomes_total_amount += income.amount
      end
      @fixed = @budget_plans.where(main_category_id: 2)
      @fixed_total_amount = 0
      @fixed.each do |fixed|
        @fixed_total_amount += fixed.amount
      end
      @variable = @budget_plans.where(main_category_id: 3)
      @variable_total_amount = 0
      @variable.each do |variable|
        @variable_total_amount += variable.amount
      end
      @investment = @budget_plans.where(main_category_id: 4)
      @investment_total_amount = 0
      @investment.each do |investment|
        @investment_total_amount += investment.amount
      end
    end
  end

  def new
    @budget_plan = BudgetPlan.new
  end

  def create
    @budget_plan = BudgetPlan.new(budget_plan_params)
    @budget_plan.save
    redirect_to budget_plans_path
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
