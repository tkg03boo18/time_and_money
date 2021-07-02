class UsersController < ApplicationController

  before_action :sign_in_required, only: [:mypage]

  def mypage
    @user = current_user
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
    params.require(:user).permit(:name, :image_id, :job, :area, :email, :is_deleted)
  end

end
