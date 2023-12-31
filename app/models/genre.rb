class Genre < ApplicationRecord
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  has_many :dislikes, dependent: :destroy
  has_many :users, through: :dislikes

  has_many :book_genres, dependent: :nullify
  has_many :books, through: :book_genres

  validates :name, length: { maximum: 20 }, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def disliked_by?(user)
    dislikes.exists?(user_id: user.id)
  end


end
