class Public::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end
  
  def destroy
  #未実装
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to request.referer
  end
  
end
