class Admin::UsersController < ApplicationController

  def index
    @users = User.all
    #最終投稿か最終ログイン日時表示させたい
  end
  
  def show
    @user = User.find(params[:id])
  end

  def destroy 
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end
end