class Public::UsersController < ApplicationController
  
  def index
  end
  
  def show
    
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    if @user.name == "guest"
      redirect_to books_path
    end
  end
  
  def edit
  end
  
  def update
  end
  
end
