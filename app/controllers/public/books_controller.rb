class Public::BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.page(params[:page]).per(10)
  end

  def new
    if current_user.guest?
      flash[:notice] = "ログイン後に投稿可能"
      redirect_to books_path
    else
      @book = Book.new
    end
  end

  def create
    if current_user.guest?
      render :new
    else
      @book = Book.new(book_params)
      @book.score = Language.get_data(book_params[:explanation])

      if @book.save
        flash[:notice] = "投稿成功"
        redirect_to books_path
      else
        render :new
      end
    end
  end

  def show
  end

  def destroy
    if current_user.id == @book.user_id
      @book.destroy
      flash[:notice] = "削除完了"
      redirect_to books_path
    else
      @books = Book.all.page(params[:page]).per(10)
      render 'index'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :explanation, genres_attributes: [:id, :name, :_destroy]).merge(user_id: current_user.id)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end