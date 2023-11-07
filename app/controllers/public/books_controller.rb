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
      @book = Book.new
    end
  end

  def create
    genre_names = params[:genre_name]
    @book = Book.new(book_params)
    #@book.score = Language.get_data(book_params[:explanation])
    if @book.save
      genre_names.each do |genre_name|
        if genre_name.present?&&genre_name != ""
          genre = Genre.find_or_create_by(user_id: current_user, name: genre_name)
          BookGenre.create(book_id: @book.id, genre_id: genre.id)
        end
      end
      flash[:notice] = "投稿成功"
      redirect_to books_path
    else
      render :new
    end
  end

  def show
  end

# def edit
#実装予定
#    @form = BooksGenre.new(title: @book.title, explanation: @book.explanation)
#  end

#  def update
#実装予定
#    @form = BooksGenre.new(update_params)
#    if @form.valid?
#      @form.update
#      redirect_to root_path
#    else
#      render :edit
#    end
#  end


  def destroy

#ユーザーは投稿を削除できず、管理者へ削除申請を行う。編集はできる。
      @book.destroy
      #flash[:notice] = "削除完了"
      redirect_to admin_books_path

  end



  private

  def book_params
    params.require(:book).permit(:title, :explanation, :genre_name).merge(user_id: current_user.id)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end