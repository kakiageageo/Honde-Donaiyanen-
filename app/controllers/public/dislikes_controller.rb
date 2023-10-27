class Public::DislikesController < ApplicationController

  def create
    genre = Genre.find(:genre_id)
    dislike = current_user.dislikes.new(genre_id: genre.id)
    dislike.save
    redirect_to request.referer
  end
  
  def destroy
    genre = Genre.find(params[:genre_id])
    dislike = current_user.dislikes.find_by(genre_id: genre.id)
    dislike.destroy
    redirect_to request.referer
  end
end
