class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index


    # @time = Time.current


    @user = current_user
    if params[:next_month]
      @books = @user.books.where(date: Time.current.next_month.beginning_of_month..Time.current.next_month.end_of_month)
      @fixed = @books.where(main_category_id: 2)
      @variable = @books.where(main_category_id: 3)
      @investment = @books.where(main_category_id: 4)
    elsif params[:prev_month]
      @books = @user.books.where(date: Time.current.prev_month.beginning_of_month..Time.current.prev_month.end_of_month)
      @fixed = @books.where(main_category_id: 2)
      @variable = @books.where(main_category_id: 3)
      @investment = @books.where(main_category_id: 4)
    else
      @books = @user.books.where(date: Time.current.beginning_of_month..Time.current.end_of_month)
      @fixed = @books.where(main_category_id: 2)
      @variable = @books.where(main_category_id: 3)
      @investment = @books.where(main_category_id: 4)
    end

    # @time = @time.next


    # Book.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month).group_by { |book| book.date.strftime('%Y%m') }


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
