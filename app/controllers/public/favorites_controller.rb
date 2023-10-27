class Public::FavoritesController < ApplicationController

  def create
    genre = Genre.find(:genre_id)
    favorite = current_user.favorites.new(genre_id: genre.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    genre = Genre.find(params[:genre_id])
    favorite = current_user.favorites.find_by(genre_id: genre.id)
    favorite.destroy
    redirect_to request.referer
  end
end
