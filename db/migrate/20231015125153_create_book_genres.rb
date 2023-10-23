class CreateBookGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :book_genres, id: false do |t|

     t.references :book, null: false, foreiign_key: true
     t.references :genre, null: false, foreign_key: true
     t.timestamps
    end

    add_index :book_genres, [:book_id, :genre_id], unique: true
  end
end
