class Book < ApplicationRecord
  belongs_to :user
  
  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres
  
  
end
