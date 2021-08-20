class ListsController < ApplicationController

  def index
    @user = current_user
    @list = List.new
    @lists = @user.lists
    @not_purchased = @lists.where(purchased: false)
    @not_purchased_total_price = @not_purchased.sum(:price)

    @books = @user.books
    @my_savings = @books.where(sub_category_id: 24)
    @my_savings_total_amount = @my_savings.sum(:amount)

  end


  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "保存に成功しました！"
      redirect_to lists_path
    else
      flash[:alert] = "保存に失敗しました"
      redirect_to lists_path
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:success] = "更新に成功しました！"
      redirect_to lists_path
    else
      flash[:alert] = "更新に失敗しました"
      redirect_to lists_path
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:success] = "削除に成功しました！"
      redirect_to lists_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to lists_path
    end
  end

  private
  def list_params
    params.require(:list).permit(:user_id, :name, :date, :price, :purchased)
  end
end
