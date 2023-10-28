class Public::BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all

  end

  def new
    if current_user.guest?
      flash[:notice] = "ログイン後に投稿可能"
      redirect_to books_path
    else
      @book = BooksGenre.new
    end
  end

  def create
    @book = BooksGenre.new(book_params)
    input_genres = book_params[:name].split(',')
    @book.create_genres(input_genres)

    #エラーの場合newページに戻る
    
      @book.save
      flash[:notice] = "投稿成功"
      redirect_to books_path
    
  end

  def show
    
  end

  def edit
    @form = BooksGenre.new(title: @book.title, explanation: @book.explanation)
  end

  def update
    @form = BooksGenre.new(update_params)
    if @form.valid?
      @form.update
      redirect_to root_path
    else
      render :edit
    end
  end


  def destroy
    if @book.destroy
      flash[:notice] = "削除完了"
      redirect_to books_path
    else
      redirect_to book_path(@book.id)
    end
  end



  private

  def book_params
    params.require(:books_genre).permit(:title, :explanation, :name).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:books_genre).permit(:title, :explanation, :name).merge(user_id: current_user.id, book_id: params[:id])
  end

  def find_book
    @book = Book.find(params[:id])
  end

end