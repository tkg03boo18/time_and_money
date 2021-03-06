class BudgetPlansController < ApplicationController
    before_action :set_budget_plan, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @budget_plan = BudgetPlan.new
    if params[:month]
      @budget_plans = @user.budget_plans.where(date: Time.current.since(params[:month].to_i.months).beginning_of_month..Time.current.since(params[:month].to_i.months).end_of_month).order(:sub_category_id)
      @outcomes = @budget_plans.where(main_category_id: [2, 3]).order(:sub_category_id)
      @incomes = @budget_plans.where(main_category_id: 1).order(:sub_category_id)
      @incomes_total_amount = @incomes.sum(:amount)
      
      @fixed = @budget_plans.where(main_category_id: 2).order(:sub_category_id)
      @fixed_total_amount = @fixed.sum(:amount)
      
      @variable = @budget_plans.where(main_category_id: 3).order(:sub_category_id)
      @variable_total_amount = @variable.sum(:amount)
      
      @investment = @budget_plans.where(main_category_id: 4).order(:sub_category_id)
      @investment_total_amount = @investment.sum(:amount)
      
    else
      @budget_plans = @user.budget_plans.where(date: Time.current.beginning_of_month..Time.current.end_of_month).order(:sub_category_id)
      @outcomes = @budget_plans.where(main_category_id: [2, 3]).order(:sub_category_id)
      @incomes = @budget_plans.where(main_category_id: 1).order(:sub_category_id)
      @incomes_total_amount = @incomes.sum(:amount)
     
      @fixed = @budget_plans.where(main_category_id: 2).order(:sub_category_id)
      @fixed_total_amount = @fixed.sum(:amount)
     
      @variable = @budget_plans.where(main_category_id: 3).order(:sub_category_id)
      @variable_total_amount = @variable.sum(:amount)
     
      @investment = @budget_plans.where(main_category_id: 4).order(:sub_category_id)
      @investment_total_amount = @investment.sum(:amount)
     
    end
  end

  def create
    @budget_plan = BudgetPlan.new(budget_plan_params)
    if @budget_plan.save
      flash[:success] = "保存に成功しました！"
      redirect_to budget_plans_path
    else
      flash[:alert] = "保存に失敗しました"
      redirect_to budget_plans_path
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
    if @budget_plan.update(budget_plan_params)
      flash[:success] = "更新に成功しました！"
      redirect_to budget_plans_path
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to budget_plans_path
    end
  end

  def destroy
    @budget_plan = BudgetPlan.find(params[:id])
    if @budget_plan.destroy
      flash[:success] = "削除に成功しました！"
      redirect_to budget_plans_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to budget_plans_path
    end
  end

  private

  def set_budget_plan
    @budget_plan = BudgetPlan.find(params[:id])
  end

  def budget_plan_params
    params.require(:budget_plan).permit(:user_id, :main_category_id, :sub_category_id, :date, :amount)
  end
end
