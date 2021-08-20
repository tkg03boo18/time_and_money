class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @book = Book.new
    if params[:month]
      @books = @user.books.where(date: Time.current.since(params[:month].to_i.months).beginning_of_month..Time.current.since(params[:month].to_i.months).end_of_month).order(:date)
      
      @outcomes = @books.where(main_category_id: [2, 3]).order(:sub_category_id)
      
      @incomes = @books.where(main_category_id: 1).order(:sub_category_id)
      @incomes_total_amount = @incomes.sum(:amount)
      
      @fixed = @books.where(main_category_id: 2).order(:sub_category_id)
      @fixed_total_amount = @fixed.sum(:amount)
      
      @variable = @books.where(main_category_id: 3).order(:sub_category_id)
      @variable_total_amount = @variable.sum(:amount)
      
      @investment = @books.where(main_category_id: 4).order(:sub_category_id)
      @investment_total_amount = @investment.sum(:amount)
    else
      @books = @user.books.where(date: Time.current.beginning_of_month..Time.current.end_of_month).order(:date)
      
      @outcomes = @books.where(main_category_id: [2, 3]).order(:sub_category_id)
      
      @incomes = @books.where(main_category_id: 1).order(:sub_category_id)
      @incomes_total_amount = @incomes.sum(:amount)
      
      @fixed = @books.where(main_category_id: 2).order(:sub_category_id)
      @fixed_total_amount = @fixed.sum(:amount)
      
      @variable = @books.where(main_category_id: 3).order(:sub_category_id)
      @variable_total_amount = @variable.sum(:amount)
      
      @investment = @books.where(main_category_id: 4).order(:sub_category_id)
      @investment_total_amount = @investment.sum(:amount)
    end
  end

  def mypage
    @user = current_user
    
    @totalbooks = @user.books
    
    @totalincomes = @totalbooks.where(main_category_id: 1)
    @totalincomes_total_amount = @totalincomes.sum(:amount)
    
    @totalfixed = @totalbooks.where(main_category_id: 2)
    @totalfixed_total_amount = @totalfixed.sum(:amount)
    
    @totalvariable = @totalbooks.where(main_category_id: 3)
    @totalvariable_total_amount = @totalvariable.sum(:amount)
    
    @totalinvestment = @totalbooks.where(main_category_id: 4)
    @totalinvestment_total_amount = @totalinvestment.sum(:amount)
    
    @books = @user.books.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    
    @not_incomes = @books.where(main_category_id: [2, 3, 4])
    
    @outcomes = @books.where(main_category_id: [2, 3])
    @outcomes_total_amount = @outcomes.sum(:amount)
    
    @incomes = @books.where(main_category_id: 1)
    @incomes_total_amount = @incomes.sum(:amount)
    
    @fixed = @books.where(main_category_id: 2)
    @fixed_total_amount = @fixed.sum(:amount)
    
    @variable = @books.where(main_category_id: 3)
    @variable_total_amount = @variable.sum(:amount)
    
    @investment = @books.where(main_category_id: 4)
    @investment_total_amount = @investment.sum(:amount)
    
    @prev_books = @user.books.where(date: Time.current.prev_month.beginning_of_month..Time.current.prev_month.end_of_month)
    
    @prev_incomes = @prev_books.where(main_category_id: 1)
    @prev_incomes_total_amount = @prev_incomes.sum(:amount)
    
    @prev_outcomes = @prev_books.where(main_category_id: [2, 3])
    @prev_not_incomes = @prev_books.where(main_category_id: [2, 3, 4])
    
    @prev_fixed = @prev_books.where(main_category_id: 2)
    @prev_fixed_total_amount = @prev_fixed.sum(:amount)
    
    @prev_variable = @prev_books.where(main_category_id: 3)
    @prev_variable_total_amount = @prev_variable.sum(:amount)
    
    @prev_investment = @prev_books.where(main_category_id: 4)
    @prev_investment_total_amount = @prev_investment.sum(:amount)

    @budget_plans = @user.budget_plans.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    
    @not_incomes_plans = @budget_plans.where(main_category_id: [2, 3, 4])
    
    @outcomes_plans = @budget_plans.where(main_category_id: [2, 3])
    @outcomes_plans_total_amount = @outcomes_plans.sum(:amount)

    @fixed_plans = @budget_plans.where(main_category_id: 2)
    @fixed_plans_total_amount = @fixed_plans.sum(:amount)

    @variable_plans = @budget_plans.where(main_category_id: 3)
    @variable_plans_total_amount = @variable_plans.sum(:amount)

    @investment_plans = @budget_plans.where(main_category_id: 4)
    @investment_plans_total_amount = @investment_plans.sum(:amount)

    @outcomes_per = @outcomes_total_amount.to_f / @outcomes_plans_total_amount.to_f
    @fixed_per = @fixed_total_amount.to_f / @fixed_plans_total_amount.to_f
    @variable_per = @variable_total_amount.to_f / @variable_plans_total_amount.to_f
    @investment_per = @investment_total_amount.to_f / @investment_plans_total_amount.to_f

    @lists = @user.lists
    @purchased_lists = @lists.where(purchased: true)
    @purchased_lists_total_price = @purchased_lists.sum(:price)

    @not_purchased_lists = @lists.where(purchased: false)
    @not_purchased_lists_total_price = @not_purchased_lists.sum(:price)

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "保存に成功しました！"
      redirect_to books_path
    else
      flash[:alert] = "保存に失敗しました"
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "更新に成功しました！"
      redirect_to books_path
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = "削除に成功しました！"
      redirect_to books_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to books_path
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:user_id, :main_category_id, :sub_category_id, :introduction, :date, :amount)
  end


end

