class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @books = @user.books
    @fixed = Book.where(main_category_id: 2)
    @variable = Book.where(main_category_id: 3)
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
  end

  def update
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
