class Public::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @book = Book.find(params[:id])
    @genre = Genre.new
  end

  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to request.referer
  end
  
end
