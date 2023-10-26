class Public::BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all

  end

  def new
    @book = BooksGenre.new
  end

  def create
    @book = BooksGenre.new(book_params)
    input_genres = book_params[:name].split(',')
    @book.create_genres(input_genres)

    #エラーの場合newページに戻る
    if @book.valid?
      @book.save
      redirect_to books_path
    else
      render :new
    end
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
    @book.destroy
    
    if admin_signed_in?
      redirect_to admin_user_path(@book.user_id)
    else
      redirect_to books_path
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