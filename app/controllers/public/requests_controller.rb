class Public::RequestsController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    requestion = current_user.requests.new(book_id: book.id)
    requestion.save
    redirect_to request.referer
  end
  
  def destroy
    book = Book.find(params[:book_id])
    requestion = current_user.requests.find_by(book_id: book.id)
    requestion.destroy
    redirect_to request.referer
  end
end
