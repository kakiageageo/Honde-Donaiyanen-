class Admin::GenresController < ApplicationController
  
  def index
    genres = Genre.all.sort {|x|
      x.dislikes.size
    }.reverse
    
    @genres = Kaminari.paginate_array(genres).page(params[:page]).per(10)
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end
end
