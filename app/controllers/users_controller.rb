class UsersController < ApplicationController

  before_action :sign_in_required, only: [:mypage]

  def mypage
    @user = current_user
    
    @plans = @user.plans.where(start_date: Time.current.beginning_of_week..Time.current.end_of_week).order(:start_date)
    
    @tasks = @user.tasks.order(:deadline)
    
    @books = @user.books.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    
    @incomes = @books.where(main_category_id: 1)
    @incomes_total_amount = @incomes.sum(:amount)
    
    @not_incomes = @books.where(main_category_id: [2, 3, 4])
    
    @fixed = @books.where(main_category_id: 2)
    @fixed_total_amount = @fixed.sum(:amount)
    
    @variable = @books.where(main_category_id: 3)
    @variable_total_amount = @variable.sum(:amount)
    
    @investment = @books.where(main_category_id: 4)
    @investment_total_amount = @investment.sum(:amount)
    
    @budget_plans = @user.budget_plans.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    
    @not_incomes_plans = @budget_plans.where(main_category_id: [2, 3, 4])
    
    @incomes_plans = @budget_plans.where(main_category_id: 1)
    @incomes_plans_total_amount = @incomes_plans.sum(:amount)
    
    @fixed_plans = @budget_plans.where(main_category_id: 2)
    @fixed_plans_total_amount = @fixed_plans.sum(:amount)
    
    @variable_plans = @budget_plans.where(main_category_id: 3)
    @variable_plans_total_amount = @variable_plans.sum(:amount)
    
    @investment_plans = @budget_plans.where(main_category_id: 4)
    @investment_plans_total_amount = @investment_plans.sum(:amount)
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "更新に成功しました！"
      redirect_to users_path
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to users_path
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    if @user.update(is_deleted: true)
      reset_session
      flash[:info] = "ご利用ありがとうございました"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :job, :area, :email, :is_deleted)
  end

end
