class Public::GenresController < ApplicationController
  
  def show
    @book = Book.find(params[:id])
    @genre = Genre.new
  end
  
  def create
    
  end
end
