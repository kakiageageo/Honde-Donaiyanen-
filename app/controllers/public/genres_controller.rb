class Public::GenresController < ApplicationController
  
  def show
    @book = Book.find(params[:id])
    @genre = Genre.new
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    
    #admin経由による削除ならadminのジャンル一覧へ、
    #ユーザーによる削除なら投稿詳細へ
    if admin_signed_in?
      redirect_to admin_genres_path
    else
      redirect_to book_path(genre.book_id)
    end
  end
  
end
