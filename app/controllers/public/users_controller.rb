class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    if @user.guest?
      redirect_to books_path
    end
  end
  
end
