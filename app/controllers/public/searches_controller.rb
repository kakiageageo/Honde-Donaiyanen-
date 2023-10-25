class Public::SearchesController < ApplicationController

  def genre_search
    @name = params[:word]
    @genres = Genre.where("name LIKE?","%#{@name}%")
  end

  def book_genre_search
    @name = params[:word]
    @genres = Genre.where("name LIKE?",@name)
  end

end
