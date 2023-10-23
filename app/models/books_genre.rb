class BooksGenre
  include ActiveModel::Model

  attr_accessor :title, :explanation, :name, :user_id
  
  def create_genres(input_genres)
    input_genres.each do |genre|
      new_genre = Genre.find_or_create_by(name: genre)
    end
    
  end

  def save
    book = Book.create(title: title, explanation: explanation, user_id: user_id)
    genre = Genre.where(name: name).first_or_initialize
    genre.save

    BookGenre.create(book_id: book.id, genre_id: genre.id)
  end


  def update
    @book = Book.where(id: book_id)
    book = @book.update(title: title, explanation: explanation, user_id: user_id)
    genre = Genre.where(name: name).first_or_initialize
    genre.save

    map = BookGenre.where(book_id: book_id )
    map.update(book_id: book_id, genre_id: genre.id)
  end



end