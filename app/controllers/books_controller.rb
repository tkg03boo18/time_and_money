class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @totalbooks = @user.books
    @totalincomes = @totalbooks.where(main_category_id: 1)
    @totalincomes_total_amount = 0
    @totalincomes.each do |ti|
      @totalincomes_total_amount += ti.amount
    end
    @totalfixed = @totalbooks.where(main_category_id: 2)
    @totalfixed_total_amount = 0
    @totalfixed.each do |tf|
      @totalfixed_total_amount += tf.amount
    end
    @totalvariable = @totalbooks.where(main_category_id: 3)
    @totalvariable_total_amount = 0
    @totalvariable.each do |tv|
      @totalvariable_total_amount += tv.amount
    end
    @totalinvestment = @totalbooks.where(main_category_id: 4)
    @totalinvestment_total_amount = 0
    @totalinvestment.each do |t_inv|
      @totalinvestment_total_amount += t_inv.amount
    end
    
    if params[:month]
      @books = Book.where(date: Time.current.since(params[:month].to_i.months).beginning_of_month..Time.current.since(params[:month].to_i.months).end_of_month)
      @outcomes = @books.where(main_category_id: [2, 3])
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
    else
      @books = @user.books.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
      @outcomes = @books.where(main_category_id: [2, 3])
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
    end

    # @bookdata = Book.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month).group_by { |book| book.date.strftime('%Y%m') }
    # @bookdatas = Book.all.group_by { |book| book.date.strftime('%Y%m') }
  end

  def mypage
    @user = current_user

    @totalbooks = @user.books
    @totalincomes = @totalbooks.where(main_category_id: 1)
    @totalincomes_total_amount = 0
    @totalincomes.each do |ti|
      @totalincomes_total_amount += ti.amount
    end
    @totalfixed = @totalbooks.where(main_category_id: 2)
    @totalfixed_total_amount = 0
    @totalfixed.each do |tf|
      @totalfixed_total_amount += tf.amount
    end
    @totalvariable = @totalbooks.where(main_category_id: 3)
    @totalvariable_total_amount = 0
    @totalvariable.each do |tv|
      @totalvariable_total_amount += tv.amount
    end
    @totalinvestment = @totalbooks.where(main_category_id: 4)
    @totalinvestment_total_amount = 0
    @totalinvestment.each do |t_inv|
      @totalinvestment_total_amount += t_inv.amount
    end

    @books = @user.books.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    @outcomes = @books.where(main_category_id: [2, 3, 4])
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
    @prev_books = @user.books.where(date: Time.current.prev_month.beginning_of_month..Time.current.prev_month.end_of_month)
    @prev_incomes = @prev_books.where(main_category_id: 1)
    @prev_incomes_total_amount = 0
    @prev_incomes.each do |income|
      @prev_incomes_total_amount += income.amount
    end
    @prev_outcomes = @prev_books.where(main_category_id: [2, 3, 4])
    @prev_fixed = @prev_books.where(main_category_id: 2)
    @prev_fixed_total_amount = 0
    @prev_fixed.each do |fixed|
      @prev_fixed_total_amount += fixed.amount
    end
    @prev_variable = @prev_books.where(main_category_id: 3)
    @prev_variable_total_amount = 0
    @prev_variable.each do |variable|
      @prev_variable_total_amount += variable.amount
    end
    @prev_investment = @prev_books.where(main_category_id: 4)
    @prev_investment_total_amount = 0
    @prev_investment.each do |investment|
      @prev_investment_total_amount += investment.amount
    end

    @budget_plans = @user.budget_plans.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
    @outcomes_plans = @budget_plans.where(main_category_id: [2, 3, 4])
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
    @investment_per = @investment_total_amount.to_f / @investment_plans_total_amount.to_f

    @lists = @user.lists
    @purchased_lists = @lists.where(purchased: true)
    @purchased_lists_total_price = 0
    @purchased_lists.each do |pl|
      @purchased_lists_total_price += pi.price
    end
    @not_purchased_lists = @lists.where(purchased: false)
    @not_purchased_lists_total_price = 0
    @not_purchased_lists.each do |npl|
      @not_purchased_lists_total_price += npl.price
    end


  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path }
      else
        format.html { render :new }
      end
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
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:user_id, :main_category_id, :sub_category_id, :introduction, :date, :amount)
  end


end
