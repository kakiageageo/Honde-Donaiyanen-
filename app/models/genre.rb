class Genre < ApplicationRecord
  
  has_many :book_genres, dependent: :destroy
  has_many :book, through: :book_genres
  
  validates :name, uniqueness: true
end
