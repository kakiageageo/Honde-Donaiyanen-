class Admin::BooksController < ApplicationController
  
  def index
    @books = Book.all.page(params[:page]).per(10)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to request.referer
  end
end
