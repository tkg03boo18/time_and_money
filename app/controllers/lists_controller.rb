class ListsController < ApplicationController

  def index
    @user = current_user
    @list = List.new
    @lists = @user.lists
    @not_purchased= @lists.where(purchased: false)
    @not_purchased_total_price = 0
    @not_purchased.each do |np|
     @not_purchased_total_price += np.price
    end
    @books = @user.books
    @my_savings = @books.where(sub_category_id: 24)
    @my_savings_total_amount = 0
    @my_savings.each do |ms|
      @my_savings_total_amount += ms.amount
    end

  end


  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:user_id, :name, :date, :price, :purchased)
  end
end
