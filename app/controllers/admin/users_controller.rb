class Admin::UsersController < ApplicationController

  def index
    @users = User.all
    #最終投稿か最終ログイン日時表示させたい
  end
  
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user).page(params[:page]).per(5)
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.is_deleted == false
      @user.update(is_deleted: true)
    else
      @user.update(is_deleted: false)
    end
    redirect_to request.referer
  end
  
end