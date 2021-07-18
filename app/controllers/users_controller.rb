class UsersController < ApplicationController

  before_action :sign_in_required, only: [:mypage]

  def mypage
    @user = current_user

    @plans = @user.plans.where(start_date: Time.current.beginning_of_week..Time.current.end_of_week)

    @tasks = @user.tasks

    @books = @user.books.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    @incomes = @books.where(main_category_id: 1)
    @incomes_total_amount = 0
    @incomes.each do |income|
      @incomes_total_amount += income.amount
    end
    @fixed = @books.where(main_category_id: 2)
    @fixed_total_amount = 0
    @fixed.each do |fixed|
      @fixed_total_amount += fixed.amount
    end
    @variable = @books.where(main_category_id: 3)
    @variable_total_amount = 0
    @variable.each do |variable|
      @variable_total_amount += variable.amount
    end
    @investment = @books.where(main_category_id: 4)
    @investment_total_amount = 0
    @investment.each do |investment|
      @investment_total_amount += investment.amount
    end

    @budget_plans = @user.budget_plans.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    @fixed_plans = @budget_plans.where(main_category_id: 2)
    @fixed_plans_total_amount = 0
    @fixed_plans.each do |fp|
      @fixed_plans_total_amount += fp.amount
    end
    @variable_plans = @budget_plans.where(main_category_id: 3)
    @variable_plans_total_amount = 0
    @variable_plans.each do |vp|
      @variable_plans_total_amount += vp.amount
    end
    @investment_plans = @budget_plans.where(main_category_id: 4)
    @investment_plans_total_amount = 0
    @investment_plans.each do |ip|
      @investment_plans_total_amount += ip.amount
    end

  end

  def mymenu
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_show_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :job, :area, :email, :is_deleted)
  end

end
