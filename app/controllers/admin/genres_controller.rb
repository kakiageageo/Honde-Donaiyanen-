class Admin::GenresController < ApplicationController
  
  def index
    @genres = Genre.all
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end
end
