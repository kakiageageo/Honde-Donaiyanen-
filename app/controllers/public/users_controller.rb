class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    if @user.guest?
      flash[:notice] = "ログイン後にマイページ利用可能"
      redirect_to books_path
    end
  end
  
  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "アカウント削除完了"
    redirect_to root_path
  end
  
end
