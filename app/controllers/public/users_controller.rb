class Public::UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])
    
    #他ユーザーのマイページは見れない
    unless @user.id == current_user.id
      redirect_to request.referer
    end
    
    @books = Book.where(user_id: @user.id)
    if @user.guest?
      flash[:notice] = "ログイン後にマイページ利用可能"
      redirect_to books_path
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "アカウント削除完了"
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name)
  end
end
